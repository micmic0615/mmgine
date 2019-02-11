var has_speed = 0;
var has_stunned = 0;
var has_flinched = 0;
var has_heal = 0;
var has_armor = 0;
var buff_list_length = ds_list_size(status_buff_list);

for(var i = 0; i < buff_list_length;i++){
	var p = ds_list_find_value(status_buff_list, i);
	var type = p[0];
	var duration = p[1];
	var values = p[2];
			
	if (has_speed == 0 && (type == "speed_bonus_raw" || type == "speed_bonus_percent")){
		//has_speed = duration;
	}
			
	if (has_stunned == 0 && type == "stunned"){
		animation_name = "stunned";
		animation_angle = 0;
		has_stunned = duration;
		has_flinched = 0;
	}
			
	if (has_flinched == 0 && has_stunned == 0 && type == "flinched"){
		animation_name = "flinched";
		animation_angle = 0;
		has_flinched =  duration;			
	}
			
	if (has_heal == 0 && type == "regen_health"){
		has_heal = duration;
	}
			
	if (has_armor == 0 && type == "armor_health" && values[0] > 0){
		has_armor = duration;
	}
}
	
var floor_age = floor(ROOM.room_age_game);
var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
			
if (has_speed > 0){
	if (animation_name == "walk"){animation_name = "dash"};
			
	if (floor_age % (0.15*SEC) == 0 && floor_age != next_floor_age){
		entity_mirage_create(1*SEC, 0, 0, make_color_rgb(0,255,255))
	};
}
		
if (has_flinched > 0){
	entity_add_blend([
		/*color*/ make_color_rgb(180,180,0),
		/*style*/ "flicker",
		/*duration*/ 2,
		/*blend_id*/ "flinch_blend_flicker"
	])
	
	physics_gravity_current = 0;
	var is_overflinch = (has_flinched > status_flinch_duration);
	var mirage_interval = is_overflinch ? 0.1*SEC : 0.2*SEC;
	if (floor_age % mirage_interval == 0 && floor_age != next_floor_age){
		if (is_overflinch){
			entity_mirage_create(0.5*SEC, random_mirror(60), random_mirror(60), make_color_rgb(255,255,0), 0.5);
		} else {
			entity_mirage_create(0.25*SEC, random_mirror(30), random_mirror(30), make_color_rgb(255,255,0), 0.35);
		}
	};
}
		
if (has_heal){
	if (status_health_current < status_health_max){
		var p_model_1 = game_particle_setup_basic(make_color_rgb(185,255,60), (1 + random(2)), 0.65, 0.5*SEC, pt_shape_ring);
		hero_particles_create(100, p_model_1, 1);
	
		var p_model_1 = game_particle_setup_basic( make_color_rgb(60,255,30), (1 + random(2)), 0.65, 0.5*SEC, pt_shape_ring);
		hero_particles_create(100, p_model_1, 1);
	} else {
		var p_model_1 = game_particle_setup_basic(make_color_rgb(185,255,60), (0.5 + random(0.5)), 0.4, 0.35*SEC, pt_shape_ring);
		hero_particles_create(100, p_model_1, 1);
	
		var p_model_1 = game_particle_setup_basic( make_color_rgb(60,255,30), (0.5 + random(0.5)), 0.4, 0.35*SEC, pt_shape_ring);
		hero_particles_create(100, p_model_1, 1);
	}
			
}
		
if (has_armor){
	if (entity_room_age_modulo(0.25*SEC)){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 0.5*SEC,
			/*blend*/ make_color_rgb(105,175,255),
			/*style_data*/ [
				sprite_width*draw_bar_health_xscale,
				sprite_width*draw_bar_health_xscale*0.9,
				0.5
			]
		);
	}
}
		
		
if (status_immortal && !status_iframe){
	if (ROOM.room_age_real % (0.2*SEC) == 0){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 1*SEC,
			/*blend*/ c_white,
			/*style_data*/ [
				sprite_width*draw_bar_health_xscale*0.9,
				sprite_width*draw_bar_health_xscale,
				1
			]
		);
	};
}