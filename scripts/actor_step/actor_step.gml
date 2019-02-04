actor_action_module_run("step");
entity_run_type_scripts("step");

#region //DRAW
	var draw_bar_health_damage_speed = (20/100)*status_health_max*PPS;
	if (draw_bar_health_damage + draw_bar_health_damage_speed > status_health_current){
		draw_bar_health_damage -= draw_bar_health_damage_speed
	} else if (draw_bar_health_damage - draw_bar_health_damage_speed < status_health_current){
		draw_bar_health_damage += draw_bar_health_damage_speed
	} else {
		draw_bar_health_damage = status_health_current
	}
#endregion


#region // BUFF MANAGEMENT
	#region //BUFF CALCULATE STATS
		actor_actions_enabled = true;
		status_armor_health = 0;
		status_armor_poise = 0;
		status_immortal = false;
		status_iframe = false;
		physics_time_local = 1;
		status_damage_total = status_damage_base;
		status_health_regen_total = status_health_regen_base;
		status_poise_regen_total = status_poise_regen_base;

		var buff_list_length = ds_list_size(status_buff_list);
		for(var i = 0; i < buff_list_length;i++){actor_buff_process_1(ds_list_find_value(status_buff_list, i))};
		for(var i = 0; i < buff_list_length;i++){actor_buff_process_2(ds_list_find_value(status_buff_list, i))};
		for(var i = 0; i < buff_list_length;i++){actor_buff_process_3(ds_list_find_value(status_buff_list, i))};
		for(var i = 0; i < buff_list_length;i++){actor_buff_process_4(ds_list_find_value(status_buff_list, i))};
	
		for(var i = 0; i < buff_list_length;i++){
			var p = ds_list_find_value(status_buff_list, i);
			var type = p[0];
			var duration = p[1];
			var arguments = p[2];
			var buff_id = p[3];
			if (duration < INFINITY){
				
				var new_duration = (type == "untimed") ? duration - 1 : duration - TIMESPEED
				ds_list_replace(status_buff_list, i, [
					type,
					new_duration,
					arguments,
					buff_id
				])
			}
		}
		
		if (status_poise_freeze_timer > 0){
			status_poise_freeze_timer -= TIMESPEED
		} else {
			status_poise_current = min(status_poise_max, status_poise_current + (status_poise_regen_total*TIMESPEED));
		}
		
		if (status_health_regen_total > 0){
			var total_regen = status_health_current + (status_health_regen_total*TIMESPEED);
			var floor_regen = floor(total_regen);
			status_health_regen_bank += (total_regen - floor_regen);
			
			while(status_health_regen_bank > 1){
				floor_regen += 1;
				status_health_regen_bank -= 1;
			}
			
			status_health_current = min(status_health_max, floor_regen);
		}
	#endregion
	
	#region // BUFF COSMETICS
		var has_speed = 0;
		var has_stunned = 0;
		var has_flinched = 0;
		var has_heal = 0;
		var has_armor = 0;
		
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
	#endregion	
	
	#region // BUFF REMOVE
		for(var i = 0; i < buff_list_length;i++){
			var p = ds_list_find_value(status_buff_list, i);
			if (p != undefined){
				var duration = p[1];
				if (duration <= 0){ds_list_delete(status_buff_list, i)}
			}
		}
	#endregion
	
	#region // AI
		if (ai_enabled && global.replay_mode == "record"){
			if (ai_delay <= 0){
				entity_run_type_scripts("ai_step")
			} else {
				ai_delay -= TIMESPEED;
			}
		}
	#endregion
#endregion

