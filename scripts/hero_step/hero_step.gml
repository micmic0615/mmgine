if (actor_actions_enabled){
	var compute_flip = (my_attack_channel_angle_target <= 90 && my_attack_channel_angle_target >= 0) || (my_attack_channel_angle_target <= 360 && my_attack_channel_angle_target >= 270)
	var action_angle = compute_flip ? my_attack_channel_angle_target : my_attack_channel_angle_target - 180;
	var action_direction = compute_flip ? 1 : -1;
	
	var floor_age = floor(ROOM.room_age_real);
	var next_floor_age = floor(ROOM.room_age_real + 1);
		
	//if (my_attack_cooldown_timer <=  0){
	//	//if (my_attack_channel_ongoing > 0){
	//	//	physics_gravity_current = 0;
	//	//	animation_name = "channel";
	//	//	animation_angle = action_angle;
	//	//	animation_direction = action_direction;
	//	//	my_attack_channel_power_current = min(my_attack_channel_power_current + TIMESPEED, my_attack_channel_power_max);
		
	//	//	;
	//	//	var power_quadroot = sqrt(sqrt(power_ratio));
	//	//	actor_buff_apply("move_set_percent", 0.1*SEC, [100 - (power_quadroot*100)], "channel_slow");
	//	//}
	//} else {
		
	//}
	
	var prev_charge = my_attack_channel_power_current;
	
	if (my_attack_cast_timer_1 > 0 || my_attack_cast_timer_2 > 0){
		animation_name = "attack";
		animation_angle = action_angle;
		animation_direction = action_direction*my_attack_direction;
		physics_gravity_current = 0;
		my_attack_cast_timer_1 -= TIMESPEED;
		my_attack_cast_timer_2 -= TIMESPEED;
		actor_buff_apply("move_set_raw", 0.1*SEC, [0], "mana_speed_lock");
	
		if (
			my_time_stop_channel == false &&
			((my_attack_cast_timer_1 > 0 && my_attack_combo_1 <= 1) || 
			(my_attack_cast_timer_2 > 0))
		){
			if (floor_age != next_floor_age){
				entity_mirage_create(0.4*SEC, 0, 0, make_color_rgb(125,125,125))
			};
		}
		
		if (my_time_stop_channel && my_time_stop_attack_mirage){
			my_time_stop_attack_mirage = false
			entity_mirage_create(0.35*SEC, 0, 0, make_color_rgb(255,125,0), animation_angle, animation_direction, Hero_attack)
		}
	} else if (my_attack_cast_timer_3 > 0) {
		status_poise_current = 0;
		animation_name = "attack_all";
		animation_angle = 0;
		animation_direction = 1;
		physics_gravity_current = 0;
		my_attack_cast_timer_3 -= TIMESPEED;
		actor_buff_apply("move_set_raw", 0.1*SEC, [0], "mana_speed_lock");
	} else if (my_attack_cast_timer_4 > 0) {
		status_poise_current = 0;
		animation_name = "attack_all";
		animation_angle = 0;
		animation_direction = 1;
		physics_gravity_current = 0;
		my_attack_cast_timer_4 -= 1;
		my_attack_delay_timer_4 -= 1;
		actor_buff_apply("move_set_raw", 0.1*SEC, [0], "mana_speed_lock");
		if (my_attack_delay_timer_4 <= 0 && my_time_stop_trigger){
			my_time_stop_trigger = false;
			my_time_stop_channel = true;
			my_time_stop_degen_interval_timer = 0;
			entity_sfx_create(
				ExplosionBulletAlt_idle,
				0.2*SEC,
				0,
				0,
				make_color_rgb(0,255,255),
				0,
				1,
				1,
				id,
				"expand",
				[
					30,
					600
				]
			)
		}
	} else {
		if (!my_time_stop_channel){my_attack_channel_power_current = min(my_attack_channel_power_current + TIMESPEED, my_attack_channel_power_max)};
		
		my_attack_cooldown_timer_1 -= TIMESPEED;
		my_attack_combo_1_window_timer -= TIMESPEED;
	}
	
	
	if (my_time_stop_channel){
		var me = id;
		with(ACTOR){
			if (player_faction != me.player_faction){
				actor_buff_apply("immortal", 0.05*SEC, [], "time_stop_immortal");
			}
		}
		status_poise_current = 0;
		actor_buff_apply("move_set_raw", 0.05*SEC, [status_movespeed_base + (my_attack_mana_speed*0.5)], "mana_speed_lock");
		actor_buff_apply("untimed", 0.5*SEC, [], "untimed");
		room_timespeed_temp(0.05, 0.5*SEC, false);
		
		if (my_time_stop_degen_interval_timer <= 0){
			entity_damage_deal([id, my_time_stop_degen_damage, true]);
			my_time_stop_degen_interval_timer = my_time_stop_degen_interval_value;
		} else {
			my_time_stop_degen_interval_timer -= 1;
		}
		
		if (ROOM.room_age_real % (0.1*SEC) == 0){
			entity_mirage_create(0.03*SEC, 0, 0, make_color_rgb(125,125,125))
		}
	} else {
		if (my_rally_limit - my_rally_degen*TIMESPEED > status_health_current){
			my_rally_limit -= my_rally_degen*TIMESPEED
		} else {
			my_rally_limit = status_health_current
		}
	}
	
	
	
	if (my_attack_channel_power_current == my_attack_channel_power_max && my_attack_channel_power_current != prev_charge){
		entity_sfx_create(
			ExplosionBulletAlt_idle,
			0.5*SEC,
			0,
			0,
			make_color_rgb(0,255,0),
			0,
			1,
			1,
			id,
			"expand",
			[
				240,
				30
			]
		)
	}
	
	my_attack_cooldown_timer_2 -= TIMESPEED;
	my_attack_combo_2_window_timer -= TIMESPEED;

	var charge_power_ratio = (my_attack_channel_power_current/my_attack_channel_power_max)
	if(charge_power_ratio > my_attack_channel_power_min){
		var draw_ratio = ((my_attack_channel_power_current - my_attack_channel_power_min)/(my_attack_channel_power_max - my_attack_channel_power_min))
		
		if (floor_age % (0.05*SEC) == 0 && floor_age != next_floor_age){
			
			if (draw_ratio >= 1){
				var mirage_color = make_color_hsv(random(255),255,255)
			} else {
				var mirage_color = make_color_rgb(0,255,0)
			}
			
			entity_mirage_create(0.35*SEC, -40*draw_ratio + random(80*draw_ratio), -40*draw_ratio + random(80*draw_ratio), mirage_color)
		};
	}


	if (my_attack_queue_1 != undefined){
		var target_angle = degtorad(my_attack_queue_1);
		var target_point = [cos(target_angle)*10 + x, sin(target_angle)*10 + y];
		hero_action_attack_1(target_point);
	} else {
		if (my_attack_queue_2 != undefined){
			var target_angle = degtorad(my_attack_queue_2);
			var target_point = [cos(target_angle)*10 + x, sin(target_angle)*10 + y];
			hero_action_attack_2(target_point);
		}
	}
	
	if (my_attack_combo_1_window_timer <= 0){my_attack_combo_1 = 0};
	if (my_attack_combo_2_window_timer <= 0){my_attack_combo_2 = 0};
	
	my_attack_channel_ongoing -= 1;
	
	if (my_attack_super_duration > 0){
		my_attack_super_duration -= TIMESPEED;
		if (floor_age != next_floor_age && floor_age % (0.05*SEC) == 0){
			var bullet_count = 0;
			var bullet_max = my_attack_super_target_angle == undefined ? 1 : 2;
			
			while(bullet_count < bullet_max){
				var super_angle = my_attack_super_target_angle == undefined ? random(360) : my_attack_super_target_angle + random(20) - 10;
				var rad_angle = degtorad(super_angle);
				var mirage_flip = (super_angle <= 90 && super_angle >= 0) || (super_angle <= 360 && super_angle >= 270)
				var mirage_angle = mirage_flip ? point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) : point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) - 180;
				var mirage_direction = mirage_flip ? 1 : -1;
			
				var spawn_x = random(140) - 70;
				var spawn_y = random(140) - 70;
			
				var bullet = actor_spawn_bullet(spawn_x, spawn_y, x + spawn_x, y + spawn_y,DefaultBullet);
				var bullet_angle = super_angle;
				var bullet_speed_factor = 2;
				bullet.status_movespeed_base = my_attack_bullet_speed * bullet_speed_factor;
				bullet.status_movesnap_base = 0.2*SEC;
				bullet.bullet_action_move_angle = bullet_angle;
		
				var rad_bullet_angle = degtorad(bullet.bullet_action_move_angle);
				bullet.animation_angle = point_direction(x,y,cos(rad_bullet_angle)*10 + x, sin(rad_bullet_angle)*10 + y)
	
				bullet.physics_gravity_on = false;
				bullet.collision_enabled_bullets = false;
	
				
		
				
				bullet.bullet_lifespan = (((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*SEC) / bullet_speed_factor) * 1.25;
				bullet.bullet_collision_tile_action = "die";
		
				
				bullet.bullet_death_spawn[?"explosion_radius_max"] = 50;
				bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
				
				var bullet_damage_value = status_damage_total;
				
				if (my_attack_super_target_angle == undefined){
					bullet.animation_sprite = "HeroBullet4";
					entity_mirage_create(0.75*SEC, spawn_x, spawn_y, make_color_rgb(255,0,255), mirage_angle, mirage_direction, Hero_attack)
					bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = make_color_rgb(255,0,255);
					bullet.bullet_seek_range = 900;
					bullet.bullet_seek_angle_limit = 360;
					bullet.bullet_seek_turn_rate = 540*PPS;
					bullet_damage_value = status_damage_total * 0.2;
					bullet.image_xscale = 0.5;
					bullet.image_yscale = 0.5;
				} else {
					bullet.animation_sprite = "HeroBullet3";
					entity_mirage_create(0.5*SEC, spawn_x, spawn_y, make_color_rgb(100,255,0), mirage_angle, mirage_direction, Hero_attack)
					bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = make_color_rgb(0,255,0);
					bullet.bullet_seek_range = 420;
					bullet.bullet_seek_turn_rate = 280*PPS;
					bullet.bullet_seek_angle_limit = 75
					bullet_damage_value = status_damage_total * 0.3;
					bullet.image_xscale = 0.55;
					bullet.image_yscale = 0.55;
				}
				
				ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", bullet_damage_value*0.35]);
				ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", bullet_damage_value, true]);
				ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
				
				
				bullet_count++;
			}
			
		}
	}
	
	my_grit_cooldown_timer -= TIMESPEED;
	
	if (!status_immortal){
		my_shield_damage_accumulated = min(my_shield_damage_treshold - 1, my_shield_damage_accumulated + my_shield_damage_regen * TIMESPEED);
	}
} else {
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer_1 = 0;
	my_attack_cooldown_timer_2 = 0;
	my_attack_cast_timer_1 = 0;
	my_attack_cast_timer_2 = 0;
	my_attack_combo_1_window_timer = 0;
	my_attack_combo_2_window_timer = 0;
	my_attack_channel_ongoing = 0;
	my_attack_super_duration = 0;
	my_attack_cast_timer_4 = 0;
	my_attack_delay_timer_4 = 0;
	my_time_stop_channel = false;
	my_time_stop_trigger = false;
}