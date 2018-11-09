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
				ds_list_replace(status_buff_list, i, [
					type,
					duration - TIMESPEED,
					arguments,
					buff_id
				])
			}
		}
		
		status_poise_current = min(status_poise_max, status_poise_current + status_poise_regen);
	#endregion
	
	#region // BUFF COSMETICS
		var has_speed = 0;
		var has_stunned = 0;
		var has_flinched = 0;
		for(var i = 0; i < buff_list_length;i++){
			var p = ds_list_find_value(status_buff_list, i);
			var type = p[0];
			var duration = p[1];
			
			if (has_speed == 0 && (type == "speed_bonus_raw" || type == "speed_bonus_percent")){
				has_speed = duration;
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
			if (floor_age % (0.1*SEC) == 0 && floor_age != next_floor_age){
				entity_mirage_create(0.5*SEC, random(30) - 15, random(30) - 15, make_color_rgb(255,255,0))
			};
		}
		
		if (status_immortal){
			if (floor_age % (0.1*SEC) == 0 && floor_age != next_floor_age){
				var bullet = actor_spawn_bullet(x, y, x,y,ExplosionBullet);
				
				bullet.animation_sprite = "ExplosionBulletAlt"

				bullet.status_movespeed_base = 0;
				bullet.status_movesnap_base = 0.2*SEC;
							
				bullet.status_health_max = INFINITY;
				bullet.status_health_current = bullet.status_health_max;
				bullet.bullet_action_move_angle = 0;
	
				bullet.physics_gravity_on = false;
				bullet.explosion_lifespan_base = 0.75*SEC;			
				bullet.explosion_lifespan_current = bullet.explosion_lifespan_base;			
				bullet.explosion_radius_min = 80;
				bullet.explosion_radius_max = 100;
				
				bullet.bullet_death_spawn[?"type"] = noone;
				
				bullet.collision_compute = false;
				bullet.collision_enabled_actors = false;
				bullet.collision_enabled_bullets = false;
				bullet.collision_enabled_doodads = false;
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

