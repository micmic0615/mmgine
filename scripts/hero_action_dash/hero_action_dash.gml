var target_point = argument0;
var my_attack_combo_2_max = 2;

if (my_time_stop_channel == false){
	if (my_attack_cooldown_timer_2 <= 0 && hero_can_act()){	
		if (my_attack_cooldown_timer_2 > 0){my_attack_combo_2 = 0}
	
		var charge_power_ratio = my_attack_channel_power_current/my_attack_channel_power_max;
		if (charge_power_ratio == 1){
			hero_shield_pulse(0.15, 300, 100);
			actor_buff_apply("immortal", 1.5*SEC, [], "on_hit_iframe");
		}
	
		my_attack_channel_power_current = 0;
		my_attack_direction = -1;
		my_attack_queue_2 = undefined;
		image_index = 0;
		my_attack_channel_angle_target = point_direction(x,y,target_point[0],target_point[1]);
	
		var bullet_angle = angle_between(x,y, target_point[0], target_point[1]);
	
		var bullet_max = 3;
		var bullet_damage_factor = 0.1;
		var bullet_size_factor = 0.65;
		var bullet_life_factor = 0.5;
		var bullet_speed_factor = 1;
		var bullet_spawn_offset = 0;

		var bullet_count = bullet_max;
	
		var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
		var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
		
	
		while(bullet_count > 0){
			var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x,bullet_y,DefaultBullet);

			bullet.status_movespeed_base = my_attack_bullet_speed * bullet_speed_factor;
			bullet.status_movesnap_base = 0.2*SEC;
			bullet.bullet_action_move_angle = bullet_angle + ((bullet_count-1)*20) - ((bullet_max-1)*10);
		
			bullet.bullet_seek_range = 320;
			bullet.bullet_seek_turn_rate = 140*PPS;
	
			bullet.physics_gravity_on = false;
			//bullet.physics_gravity_factor = 10;
			//bullet.collision_enabled_tiles = false;
	
			bullet.image_xscale = bullet_size_factor;
			bullet.image_yscale = bullet_size_factor;
		
			bullet.animation_sprite = "HeroBullet2";
		
			bullet.bullet_lifespan = ((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*SEC) * bullet_life_factor;
			bullet.bullet_collision_tile_action = "die";

			ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*bullet_damage_factor, true]);
			ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", 80, 0.75*SEC, "movement", ["multiply",1.5]]);
		
			ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "bullet", 1, true]);
			ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
		
			bullet.bullet_death_spawn[?"explosion_radius_max"] = 90;
			bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = make_color_rgb(0,255,255)
			bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
		
			bullet_count --;
		}
	
		var dash_range = my_attack_cooldown_timer_2 <= 0 ?  (my_attack_dash_range + (my_attack_combo_2*my_attack_dash_range*0.0)) : (my_attack_dash_range*0.3)
	
		entity_motion_push(dash_range, ((my_attack_dash_speed)/(dash_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
	
		my_attack_combo_2 += 1;
		if (my_attack_combo_2 == 1 && my_attack_cooldown_timer_2 <= 0){
			actor_buff_apply("speed_bonus_raw", my_attack_mana_speed_duration, [my_attack_mana_speed], "mana_speed_boost");
		}
	
		my_attack_cast_timer_2 = my_attack_cooldown_timer_2 <= 0 ? my_attack_cast_value_2 : my_attack_cast_value_2*2;
	
		if (my_attack_cooldown_timer_2 <= 0){
			if (my_attack_combo_2 >= my_attack_combo_2_max){
				my_attack_cooldown_timer_2 = my_attack_cooldown_finisher_delay_2 - my_attack_cast_value_2;
				my_attack_combo_2_window_timer = my_attack_cooldown_finisher_delay_2 - my_attack_cast_value_2;
			} else {
				my_attack_cooldown_timer_2 = my_attack_cooldown_value_2;
				my_attack_combo_2_window_timer = my_attack_combo_2_window_value;
			}
		}
	} else {
		if (my_attack_cooldown_timer_2 > 0 || my_attack_cast_timer_2 > 0){
			if (my_attack_combo_2 < my_attack_combo_2_max){
				my_attack_queue_2 = angle_between(target_point[0],target_point[1],x,y )  
			}
		}
	}
}
