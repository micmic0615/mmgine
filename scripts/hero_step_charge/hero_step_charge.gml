var floor_age = floor(ROOM.room_age_game);
var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);

var prev_charge_1 = my_charge_meter_1;
var prev_charge_2 = my_charge_meter_2;

var charge_value_1 = my_charge_meter_1/my_charge_max;
var charge_value_2 = my_charge_meter_2/my_charge_max;

var p_spawn_1 = 60 + (40*charge_value_1);
var p_spawn_2 = 60 + (40*charge_value_2);

var p_count_1 = ceil(2*charge_value_1);
var p_count_2 = ceil(2*charge_value_2);

var p_model_1 = game_particle_setup_basic(my_charge_color_1, (0.5 + random(1)*charge_value_1), 0.6*charge_value_1, 0.35*SEC);
var p_model_2 = game_particle_setup_basic(my_charge_color_2, (0.5 + random(1)*charge_value_2), 0.6*charge_value_2, 0.35*SEC);

my_charge_draw_angle += 20*PPS;

if (actor_actions_idle){
	if (action_shoot[?"cast_timer"] <= 0 && action_shoot[?"channel_timer"] <= 0){
		var charge_accelerator = 1;
		if (my_shoot_aim_mode){
			charge_accelerator = 1.7;
			animation_name = "channel";
		} else {
			if (my_charge_accelerate_delay_timer > 0){
				my_charge_accelerate_delay_timer -= TIMESPEED
			} else {
				charge_accelerator = 2.5;
				if (actor_actions_id == "none" && (my_charge_meter_1 < my_charge_max || my_charge_meter_2 < my_charge_max)){
					animation_name = "charge";
					if (my_charge_meter_1 < my_charge_max && floor_age != next_floor_age){
						hero_particles_create(p_spawn_1, p_model_1, p_count_1)
					}
					
					if (my_charge_meter_2 < my_charge_max && floor_age != next_floor_age){
						hero_particles_create(p_spawn_2, p_model_2, p_count_2)
					}
				}
			}
		}
		
		if (action_dash[?"channel_timer"] <= 0 && action_dash_cooldown_check() <= 0){
			my_charge_meter_1 = min((my_charge_meter_1 + (TIMESPEED*charge_accelerator)), my_charge_max);
			my_charge_meter_2 = min((my_charge_meter_2 + (TIMESPEED*charge_accelerator)), my_charge_max);
		}
	} else {
		my_charge_accelerate_delay_timer = max(my_charge_accelerate_delay_value, my_charge_accelerate_delay_timer);
	}
	
	if (my_charge_meter_1 >= my_charge_min && my_charge_meter_1 < my_charge_max && floor_age != next_floor_age){		
		hero_particles_create(p_spawn_1, p_model_1, p_count_1);			
	}
	
	if (my_charge_meter_2 >= my_charge_min && my_charge_meter_2 < my_charge_max && floor_age != next_floor_age){		
		hero_particles_create(p_spawn_2, p_model_2, p_count_2);
	}
}

if (my_charge_permabuff > 0 && floor_age != next_floor_age){
	my_charge_permabuff -= TIMESPEED;
	my_charge_meter_1 = my_charge_max;
	my_charge_meter_2 = my_charge_max;
	
	var p_model_1 = game_particle_setup_basic(my_charge_color_1, (1 + random(1)), 1, 0.5*SEC, pt_shape_snow);
	var p_model_2 = game_particle_setup_basic(my_charge_color_2, (1 + random(1)), 1, 0.5*SEC, pt_shape_snow);
	
	hero_particles_create(100, p_model_1, 2);
	hero_particles_create(100, p_model_2, 2);
}

if (my_charge_meter_1 == my_charge_max){
	if (my_charge_max != prev_charge_1){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 0.35*SEC*TIMESPEED,
			/*blend*/ my_charge_color_1,
			/*style_data*/ [
				0,
				220,
				2
			]
		)
		
		var p_loop = 3;
		while(p_loop > 0){
			var p_count = 3;
			var p_model = game_particle_setup_basic(my_charge_color_1, (3 + random(3)), (3 + random(1)), ((0.5*SEC) + random(0.25*SEC)), pt_shape_snow);
			
			hero_particles_create(80, p_model, p_count);
			p_loop --;
		}
	} else if (floor_age != next_floor_age && floor_age % (0.2*SEC) == 0){
		var flicker_range = 50;
		entity_mirage_create(0.3*SEC, random(flicker_range) - (flicker_range/2), random(flicker_range) - (flicker_range/2), my_charge_color_1, 0.5, animation_angle, animation_direction);
	}
}

if (my_charge_meter_2 == my_charge_max){
	if (my_charge_max != prev_charge_2){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 0.35*SEC*TIMESPEED,
			/*blend*/ my_charge_color_2,
			/*style_data*/ [
				0,
				220,
				2
			]
		)
		
		var p_loop = 3;
		while(p_loop > 0){
			var p_count = 3;
			var p_model = game_particle_setup_basic(my_charge_color_2, (3 + random(3)), (3 + random(1)), ((0.5*SEC) + random(0.25*SEC)), pt_shape_snow);
			
			hero_particles_create(80, p_model, p_count);
			p_loop --;
		}
	} else if (floor_age != next_floor_age && floor_age % (0.2*SEC) == 0){
		var flicker_range = 50;
		entity_mirage_create(0.3*SEC, random(flicker_range) - (flicker_range/2), random(flicker_range) - (flicker_range/2), my_charge_color_2, 0.5, animation_angle, animation_direction);
	}
}
