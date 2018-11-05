var target_point = argument0;
var my_attack_combo_max = 4;

if (my_attack_cooldown_timer <= 0){	
	my_attack_direction = 1;
	my_attack_queue_1 = undefined;
	image_index = 0;
	my_attack_channel_angle_target = point_direction(x,y,target_point[0],target_point[1]);
	
	var channel_multiplier_bullet = 1 + ((my_attack_channel_power_current/my_attack_channel_power_max)*1);
	var channel_multiplier_dash = 1 + ((my_attack_channel_power_current/my_attack_channel_power_max)*0.65);
	
	var bullet_angle = angle_between(target_point[0], target_point[1], x,y);
	
	var bullet_max = 0;
	var bullet_damage_factor = 0;
	var bullet_size_factor = 0;
	var bullet_life_factor = 0;
	var bullet_speed_factor = 0;
	var bullet_push_factor = 0;
	var bullet_spawn_offset = 0;
	
	switch(my_attack_combo){
		case 0: 
			bullet_max = 1;
			bullet_damage_factor = 1;
			bullet_push_factor = 1;
			bullet_size_factor = 1;
			bullet_life_factor = 1;
			bullet_speed_factor = 1;
			break
		
		case 1: 
			bullet_max = 3;
			bullet_damage_factor = 0.5;
			bullet_push_factor = 0.25;
			bullet_size_factor = 0.6;
			bullet_life_factor = 0.8;
			bullet_speed_factor = 1.25;
			break
		
		default: 
		case 2: 
			bullet_max = 5;
			bullet_damage_factor = 0.35;
			bullet_push_factor = 0.2;
			bullet_size_factor = 0.5;
			bullet_life_factor = 0.67;
			bullet_speed_factor = 1.5;
			break
		
		//case 3: 
		//	bullet_max = 7;
		//	bullet_damage_factor = 0.3;
		//	bullet_push_factor = 0.15;
		//	bullet_size_factor = 0.4;
		//	bullet_life_factor = 0.5;
		//	bullet_speed_factor = 2;
		//	break
			
		
	}
	
	var bullet_count = bullet_max;
	
	var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
	var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
	
	var bullet_spread_angle = my_attack_channel_power_current == my_attack_channel_power_max ? 30 : 8;
	
		
	
	while(bullet_count > 0){
		var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x,bullet_y,DefaultBullet);

		bullet.status_movespeed_base = my_attack_bullet_speed * bullet_speed_factor;
		bullet.status_movesnap_base = 0.2*SEC;
		bullet.bullet_action_move_angle = bullet_angle + ((bullet_count-1)*bullet_spread_angle) - ((bullet_max-1)*(bullet_spread_angle/2));
	
		bullet.physics_gravity_on = false;
		//bullet.physics_gravity_factor = 10;
		//bullet.collision_enabled_tiles = false;
	
		bullet.image_xscale = channel_multiplier_bullet*bullet_size_factor;
		bullet.image_yscale = channel_multiplier_bullet*bullet_size_factor;
		
		bullet.bullet_seek_range = 240;
		bullet.bullet_seek_turn_rate = 160*PPS;
		bullet.bullet_lifespan = ((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*channel_multiplier_bullet*SEC) * bullet_life_factor;
		bullet.bullet_collision_tile_action = my_attack_channel_power_current/my_attack_channel_power_max > 0.95 ? "bounce" : "die";

		ds_list_add(bullet.bullet_collision_entity_actions, ["damage", status_damage_total*channel_multiplier_bullet*bullet_damage_factor, true]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", status_damage_total*bullet_damage_factor*2]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["push", 100*channel_multiplier_bullet*bullet_push_factor , 0.75*SEC, "movement", ["multiply",1.5]]);
		
		bullet_count --;
	}

	actor_buff_apply("move_set_raw", my_attack_cooldown_value_1, [0], "mana_speed_lock");
	
	
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = my_attack_cooldown_value_1;	
	my_attack_combo += 1;
	
	if (my_attack_combo <= 1){
		actor_buff_apply("speed_bonus_raw", 1.5*SEC, [my_attack_mana_speed], "mana_speed_boost");
		entity_motion_push((my_attack_dash_range*channel_multiplier_dash), (my_attack_dash_speed/(my_attack_dash_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
	} else {
		actor_buff_apply("speed_bonus_raw", 0.1*SEC, [my_attack_mana_speed], "mana_speed_boost");
		entity_motion_push((my_attack_dash_range*channel_multiplier_dash) * 0.25, (my_attack_dash_speed/(my_attack_dash_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
	}
	
	if (my_attack_combo >= my_attack_combo_max){
		my_attack_combo_window_timer = 0;
		actor_buff_apply("silenced", my_attack_combo_window_value, [0], "mana_silence");
	} else {
		my_attack_combo_window_timer = my_attack_combo_window_value;
	}
} else {
	if (my_attack_combo < my_attack_combo_max){
		my_attack_queue_1 = angle_between(target_point[0],target_point[1],x,y )  
	}
}