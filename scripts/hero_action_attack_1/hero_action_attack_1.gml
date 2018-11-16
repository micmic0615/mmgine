var target_point = argument0;
var my_attack_combo_1_max = 4;

if (my_attack_cooldown_timer_1 <= 0 && hero_can_act()){	
	
	my_attack_direction = 1;
	my_attack_queue_1 = undefined;
	image_index = 0;
	my_attack_channel_angle_target = point_direction(x,y,target_point[0],target_point[1]);
	
	var charge_power_ratio = my_attack_channel_power_current/my_attack_channel_power_max;
	if (charge_power_ratio < my_attack_channel_power_min){charge_power_ratio = 0}
	var channel_multiplier_bullet = 1 + charge_power_ratio;
	var channel_multiplier_dash = 1 + ((my_attack_channel_power_current/my_attack_channel_power_max)*0.65);
	
	var bullet_angle = angle_between(target_point[0], target_point[1], x,y);
	
	var bullet_max = 0;
	var bullet_damage_factor = 0;
	var bullet_flinch_factor = 0;
	var bullet_size_factor = 0;
	var bullet_life_factor = 0;
	var bullet_speed_factor = 0;
	var bullet_push_factor = 0;
	var bullet_spawn_offset = 0;
	
	switch(my_attack_combo_1){
		case 0: 
			bullet_max = 1;
			bullet_damage_factor = 1;
			bullet_flinch_factor = 1;
			bullet_push_factor = 1;
			bullet_size_factor = 1;
			bullet_life_factor = 1;
			bullet_speed_factor = 1;
			break
		
		case 1: 
			bullet_max = 3;
			bullet_damage_factor = 0.8;
			bullet_flinch_factor = 0.15;
			bullet_push_factor = 0.25;
			bullet_size_factor = 0.6;
			bullet_life_factor = 0.8;
			bullet_speed_factor = 1.25;
			break
		
		 
		case 2: 
			bullet_max = 5;
			bullet_damage_factor = 0.6;
			bullet_flinch_factor = 0.05;
			bullet_push_factor = 0.2;
			bullet_size_factor = 0.5;
			bullet_life_factor = 0.67;
			bullet_speed_factor = 1.5;
			break
		
		case 3: 
		default:
			bullet_max = 7;
			bullet_damage_factor = 0.5;
			bullet_flinch_factor = 0.00;
			bullet_push_factor = 0.15;
			bullet_size_factor = 0.4;
			bullet_life_factor = 0.5;
			bullet_speed_factor = 2;
			break
			
		
	}
	
	var bullet_count = bullet_max;
	
	var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
	var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
	
	var bullet_spread_angle = my_attack_channel_power_current == my_attack_channel_power_max ? 30 : 6;
	
	while(bullet_count > 0){
		var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x,bullet_y,DefaultBullet);

		bullet.status_movespeed_base = my_attack_bullet_speed * bullet_speed_factor * channel_multiplier_bullet;
		bullet.status_movesnap_base = 0.2*SEC;
		bullet.bullet_action_move_angle = bullet_angle + ((bullet_count-1)*bullet_spread_angle) - ((bullet_max-1)*(bullet_spread_angle/2));
		
		var rad_bullet_angle = degtorad(bullet.bullet_action_move_angle);
		
		bullet.animation_angle = point_direction(x,y,cos(rad_bullet_angle)*10 + x, sin(rad_bullet_angle)*10 + y)
	
		bullet.physics_gravity_on = false;
	
		bullet.image_xscale = channel_multiplier_bullet*bullet_size_factor;
		bullet.image_yscale = channel_multiplier_bullet*bullet_size_factor;
		
		
		bullet.bullet_seek_range = 240;
		bullet.bullet_seek_turn_rate = 160*PPS;
		bullet.bullet_lifespan = ((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*SEC) * bullet_life_factor;
		bullet.bullet_collision_tile_action = "die";
		
		if (my_time_stop_channel){
			with(bullet){
				entity_motion_push(180, 0.02*SEC, bullet_angle, ["multiply",1.25], "move_motion");
			}
			
			var speed_factor = 2.5;
			bullet.status_movespeed_base *= speed_factor;
			bullet.bullet_lifespan /= speed_factor;
		}
		
		
		bullet.animation_sprite = channel_multiplier_bullet == 2 ? "HeroBullet3" : "HeroBullet1";
		
		var bullet_damage_value = status_damage_total + ((charge_power_ratio * my_attack_channel_power_bonus_factor)*status_damage_total)
		var bullet_flinch_value = my_attack_bullet_flinch_damage + ((charge_power_ratio * my_attack_channel_power_bonus_factor)*my_attack_bullet_flinch_damage)
	
		ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", bullet_damage_value*bullet_damage_factor, true]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", bullet_flinch_value*bullet_flinch_factor]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", 100*channel_multiplier_bullet*bullet_push_factor , 0.75*SEC, "movement", ["multiply",1.5]]);
		
		ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "bullet", channel_multiplier_bullet == 2 ? INFINITY : 1, true]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "bullet", 1]);
		
		
		bullet.bullet_death_spawn[?"explosion_radius_max"] = round(160*(bullet_damage_value*bullet_damage_factor / status_damage_total));
		bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = my_attack_channel_power_current == my_attack_channel_power_max ? make_color_rgb(0,255,0) : make_color_rgb(255,125,0)
		bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
		bullet.bullet_death_spawn[?"status_immortal"] = true;
		
		if (channel_multiplier_bullet == 2){
			bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
				["damage", "actor", bullet_damage_value*bullet_damage_factor*0.25, true],
				["flinch", "actor", bullet_flinch_value*bullet_flinch_factor*1],
			]
		} else {
			bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
				["damage", "actor", bullet_damage_value*bullet_damage_factor*0.25, true],
			]
		}
		
		
		
		bullet_count --;
	}	
	
	
	if (my_time_stop_channel){
		entity_damage_deal([id, my_time_stop_attack_cost, true]);
		my_time_stop_attack_mirage = true
		my_attack_combo_1 = 0;
	} else {
		my_attack_combo_1 += 1;
	}
	
	
	if (my_attack_combo_1 == 1 && my_time_stop_channel == false){
		actor_buff_apply("speed_bonus_raw", my_attack_mana_speed_duration, [my_attack_mana_speed], "mana_speed_boost");
	}
	
	if (!my_time_stop_channel){
		if (my_attack_combo_1 <= 1){
			entity_motion_push((my_attack_recoil_range*channel_multiplier_dash), (my_attack_recoil_speed/(my_attack_recoil_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
		} else {
			entity_motion_push((my_attack_recoil_range*channel_multiplier_dash) * 0.25, (my_attack_recoil_speed/(my_attack_recoil_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
		}
	}
	
	
	
	
	my_attack_channel_power_current = 0;
	
	if (my_attack_combo_1 >= my_attack_combo_1_max){
		my_attack_cooldown_timer_1 = 1;
		my_attack_cast_timer_1 = my_attack_cooldown_finisher_delay_1;
		my_attack_combo_1_window_timer = my_attack_cooldown_finisher_delay_1 - my_attack_cast_timer_1;
	} else {
		my_attack_cast_timer_1 = my_attack_cast_value_1;
		my_attack_cooldown_timer_1 = my_attack_cooldown_value_1;
		my_attack_combo_1_window_timer = my_attack_combo_1_window_value;
	}
} else {
	//if (my_attack_combo_1 < my_attack_combo_1_max){
	//	my_attack_queue_1 = angle_between(target_point[0],target_point[1],x,y )  
	//}
}


