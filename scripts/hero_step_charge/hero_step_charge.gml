var floor_age = floor(ROOM.room_age_game);
var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);

var prev_charge = my_charge_current;
var charge_value = my_charge_current/my_charge_max;

if (actor_actions_idle && my_charge_current < my_charge_max){
	var p_spawn = 60 + (40*charge_value);
	var p_count = ceil(5*charge_value);
	var p_model = game_particle_setup_basic(my_shoot_flair_color, (0.5 + random(1.5)*charge_value), 2*charge_value, 0.5*SEC);
	part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),ps_shape_ellipse,1);
		
	var charge_sfx_interval = 0.4*SEC;
	if (action_shoot_cast_timer <= 0 && action_shoot_channel_timer <= 0){
		var charge_accelerator = 1;
		if (my_charge_accelerate_delay_timer > 0){
			my_charge_accelerate_delay_timer -= TIMESPEED
		} else {
			charge_accelerator = 2.5;
			if (actor_actions_id == "none"){
				animation_name = "charge";
				part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			}
		}
		
		my_charge_current = min((my_charge_current + (TIMESPEED*charge_accelerator)), my_charge_max)
	} else {
		my_charge_accelerate_delay_timer = max(my_charge_accelerate_delay_value, my_charge_accelerate_delay_timer);
	}
	
	if (my_charge_current >= my_charge_min){		
		part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
	}
}

if (my_charge_current == my_charge_max){
	if (my_charge_max != prev_charge){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 0.35*SEC*TIMESPEED,
			/*blend*/ my_shoot_flair_color,
			/*style_data*/ [
				0,
				220,
				2
			]
		)
		
		var p_spawn = 80;
		part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),ps_shape_ellipse,1);
		
		var p_loop = 8;
		
		while(p_loop > 0){
			var p_count = 4;
			var p_model = game_particle_setup_basic(my_shoot_flair_color, (1 + random(2)), (3 + random(1)), ((0.5*SEC) + random(0.25*SEC)));
			part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			p_loop --;
		}
	} else if (floor_age != next_floor_age && floor_age % (0.1*SEC) == 0){
		var flicker_range = 30;
		entity_mirage_create(0.3*SEC, random(flicker_range) - (flicker_range/2), random(flicker_range) - (flicker_range/2), my_shoot_flair_color, animation_angle, animation_direction);
	}
}


