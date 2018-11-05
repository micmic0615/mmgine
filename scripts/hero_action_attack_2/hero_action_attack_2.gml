var target_point = argument0;
var my_attack_combo_max = 4;

if (my_attack_cooldown_timer <= 0 && my_attack_combo <= 1){	
	my_attack_direction = -1;
	my_attack_queue_2 = undefined;
	image_index = 0;
	my_attack_channel_angle_target = point_direction(x,y,target_point[0],target_point[1]);
	
	var channel_multiplier_bullet = 1;
	var channel_multiplier_dash =  1.25 - (0.75*(my_attack_channel_power_current/my_attack_channel_power_max));
	
	var dash_range = my_attack_dash_range*channel_multiplier_dash;
	
	var bullet_angle = angle_between(x,y, target_point[0], target_point[1]);
	
	var bullet_max = 4;
	var bullet_damage_factor = 0.2;
	var bullet_size_factor = 0.65;
	var bullet_life_factor = 0.5;
	var bullet_speed_factor = 1;
	var bullet_push_factor = 0.1;
	var bullet_spawn_offset = 0;
	
	if (my_attack_channel_power_current == my_attack_channel_power_max){
		bullet_max = 8
		bullet_size_factor = 0.4;
		bullet_life_factor = 0.35
	}
	
	var bullet_count = bullet_max;
	
	var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
	var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
		
	
	while(bullet_count > 0){
		var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x,bullet_y,DefaultBullet);

		bullet.status_movespeed_base = my_attack_bullet_speed * bullet_speed_factor;
		bullet.status_movesnap_base = 0.2*SEC;
		bullet.bullet_action_move_angle = bullet_angle + ((bullet_count-1)*30) - ((bullet_max-1)*15);
	
		bullet.physics_gravity_on = false;
		//bullet.physics_gravity_factor = 10;
		//bullet.collision_enabled_tiles = false;
	
		bullet.image_xscale = channel_multiplier_bullet*bullet_size_factor;
		bullet.image_yscale = channel_multiplier_bullet*bullet_size_factor;
		
		bullet.bullet_lifespan = ((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*channel_multiplier_bullet*SEC) * bullet_life_factor;
		bullet.bullet_collision_tile_action = my_attack_channel_power_current/my_attack_channel_power_max > 0.95 ? "bounce" : "die";

		ds_list_add(bullet.bullet_collision_entity_actions, ["damage", status_damage_total*channel_multiplier_bullet*bullet_damage_factor, true]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", status_damage_total*bullet_damage_factor]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["push", 100*channel_multiplier_bullet*bullet_push_factor , 0.75*SEC, "movement", ["multiply",1.5]]);
		
		bullet_count --;
	}

	actor_buff_apply("move_set_raw", my_attack_cooldown_value_1, [0], "mana_speed_lock");
	actor_buff_apply("speed_bonus_raw", 1*SEC, [my_attack_mana_speed/2], "mana_speed_boost");
	my_attack_cooldown_timer = my_attack_cooldown_value_2;	
	
	entity_motion_push(dash_range, ((my_attack_dash_speed)/(my_attack_dash_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
	
	my_attack_combo = 1;
	my_attack_combo_window_timer = my_attack_combo_window_value*1.5;
} else {
	my_attack_queue_2 = angle_between(target_point[0],target_point[1],x,y )  
}