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
		animation_name = "attack";
		animation_angle = action_angle;
		animation_direction = action_direction*my_attack_direction;
		my_attack_cooldown_timer -= TIMESPEED;
		physics_gravity_current = 0;
	
		if (my_attack_combo <= 1){
			if (floor_age != next_floor_age){
				entity_mirage_create(0.4*SEC, 0, 0, make_color_rgb(125,125,125))
			};
		}
	}

	if(my_attack_channel_power_current > 0){
		var power_ratio = (my_attack_channel_power_current/my_attack_channel_power_max);
		
		
		if (floor_age % (0.05*SEC) == 0 && floor_age != next_floor_age){
			entity_mirage_create(0.35*SEC, -25*power_ratio + random(50*power_ratio), -25*power_ratio + random(50*power_ratio), make_color_hsv(power_ratio >= 0.95 ? random(255) : 230,255,255))
		};
	}


	if (my_attack_queue_1 != undefined){
		var target_angle = degtorad(my_attack_queue_1);
		var target_point = [cos(target_angle)*10 + x, sin(target_angle)*10 + y];
		hero_action_attack_1(target_point);
	} else {
		if (my_attack_combo_window_timer <=  0){
			my_attack_combo = 0;
		}
	
		if (my_attack_queue_2 != undefined){
			var target_angle = degtorad(my_attack_queue_2);
			var target_point = [cos(target_angle)*10 + x, sin(target_angle)*10 + y];
			hero_action_attack_2(target_point);
		}
	}

	my_attack_combo_window_timer -= TIMESPEED;
	my_attack_channel_ongoing -= 1;
	
	if (my_attack_super_duration > 0){
		my_attack_super_duration -= TIMESPEED;
		if (floor_age != next_floor_age && floor_age % (0.05*SEC) == 0){
			
			var super_angle = my_attack_super_target_angle + random(20) - 10;
			var rad_angle = degtorad(super_angle);
			var mirage_flip = (super_angle <= 90 && super_angle >= 0) || (super_angle <= 360 && super_angle >= 270)
			var mirage_angle = compute_flip ? point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) : point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) - 180;
			var mirage_direction = compute_flip ? 1 : -1;
			
			var spawn_x = random(140) - 70;
			var spawn_y = random(140) - 70;
			
			entity_mirage_create(0.5*SEC, spawn_x, spawn_y, make_color_rgb(100,255,0), mirage_angle, mirage_direction, Hero_attack)
			
			
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
	
			bullet.image_xscale = 0.5;
			bullet.image_yscale = 0.5;
		
			bullet.bullet_seek_range = 360;
			bullet.bullet_seek_turn_rate = 240*PPS;
			bullet.bullet_lifespan = (((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*SEC) / bullet_speed_factor) * 1.25;
			bullet.bullet_collision_tile_action = "die";
		
			bullet.animation_sprite = "HeroBullet3";
		
			var bullet_damage_value = status_damage_total * 0.25;
	
			ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", bullet_damage_value, true]);
			ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", bullet_damage_value*0.5]);
		
			ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
			ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "bullet", INFINITY]);
		}
	}
} else {
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = 0;
	my_attack_combo_window_timer = 0;
	my_attack_channel_ongoing = 0;
	my_attack_super_duration = 0;
}