if (actor_actions_enabled){
	var compute_flip = (my_attack_channel_angle_target <= 90 && my_attack_channel_angle_target >= 0) || (my_attack_channel_angle_target <= 360 && my_attack_channel_angle_target >= 270)
	var action_angle = compute_flip ? my_attack_channel_angle_target : my_attack_channel_angle_target - 180;
	var action_direction = compute_flip ? 1 : -1;
	
	var floor_age = floor(ROOM.room_age_game);
	var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);

	if (my_attack_cooldown_timer <=  0){
		if (my_attack_channel_ongoing > 0){
			physics_gravity_current = 0;
			animation_name = "channel";
			animation_angle = action_angle;
			animation_direction = action_direction;
			my_attack_channel_power_current = min(my_attack_channel_power_current + TIMESPEED, my_attack_channel_power_max);
		
			var power_ratio = (my_attack_channel_power_current/my_attack_channel_power_max);
			var power_quadroot = sqrt(sqrt(power_ratio));
			actor_buff_apply("move_set_percent", 0.1*SEC, [100 - (power_quadroot*100)], "channel_slow");
		}
	} else {
		my_attack_cooldown_timer -= TIMESPEED;
	
		if (my_attack_cast_timer > 0){
			animation_name = "attack";
			
			
			animation_angle = action_angle;
			animation_direction = action_direction;
			my_attack_cast_timer -= TIMESPEED;
			physics_gravity_current = 0;
			
			var floor_age = floor(ROOM.room_age_game);
			var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
			if (floor_age != next_floor_age){
				entity_mirage_create(0.4*SEC, 0, 0, make_color_rgb(125,125,125));
			}
			
			if (floor_age != next_floor_age && floor_age % (0.1*SEC) == 0){
				var current_angle = my_attack_pelter_angle + random(10) - 5;
				var rad_angle = degtorad(current_angle)
				my_attack_channel_angle_target = point_direction(x,y,x + cos(rad_angle)*5, y + sin(rad_angle)*5)
				
				var bullet = actor_spawn_bullet(x,y,x,y,DefaultBullet);

				bullet.status_movespeed_base = my_attack_bullet_speed;
				bullet.status_movesnap_base = 0.2*SEC;
				bullet.status_health_max = 1;
				bullet.status_health_current = bullet.status_health_max;
				bullet.bullet_action_move_angle = current_angle;
	
				bullet.physics_gravity_on = false;
	
				bullet.image_xscale = 0.5;
				bullet.image_yscale = 0.5;
	
				bullet.animation_sprite = "PelterBullet1";
		
				bullet.bullet_seek_range = 600;
				bullet.bullet_seek_turn_rate = 60*PPS;
				bullet.bullet_lifespan = ((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*SEC);
				bullet.bullet_collision_tile_action = "die";
	
				bullet.bullet_death_spawn[?"explosion_radius_min"] = 30;
				bullet.bullet_death_spawn[?"explosion_radius_max"] = 120;
				bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = make_color_rgb(255,255,0);
				bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;

				ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*0.5, true]);
				ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", status_damage_total*0.75]);
				ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", -25 , 0.75*SEC, "movement", ["multiply",1.5]]);
	
				ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "bullet", INFINITY, true]);
				ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
				
				var mini_dash_range = my_attack_dash_range*0.15
	
				entity_motion_push((mini_dash_range), (my_attack_dash_speed/(mini_dash_range*PPS))*SEC, current_angle - 180, ["multiply",1.25], "move_motion");
			}
			
		}
	}

	my_attack_channel_ongoing -= 1;
} else {
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = 0;
	my_attack_channel_ongoing = 0;
	my_attack_cast_timer = 0;
}