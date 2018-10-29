if (my_attack_cooldown_timer == 0){
	var target_point = argument0;
	
	var channel_multiplier_bullet = 1 + ((my_attack_channel_power_current/my_attack_channel_power_max)*1);
	var channel_multiplier_dash = 1 + ((my_attack_channel_power_current/my_attack_channel_power_max)*0.65);

	var bullet = actor_spawn_bullet(target_point[0], target_point[1], x,y,DefaultBullet);

	bullet.status_movespeed_base = my_attack_bullet_speed;
	bullet.status_movesnap_base = 0.2*SEC;
	
	bullet.image_xscale = channel_multiplier_bullet;
	bullet.image_yscale = channel_multiplier_bullet;

	bullet.bullet_lifespan = ((my_attack_bullet_range*PPS)/my_attack_bullet_speed)*channel_multiplier_bullet*SEC;
	bullet.bullet_collision_tile_action = my_attack_channel_power_current/my_attack_channel_power_max > 0.95 ? "bounce" : "die";

	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", status_damage_total*channel_multiplier_bullet, true]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", status_damage_total*2]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["push", 100*channel_multiplier_bullet , 0.75*SEC, bullet.bullet_action_move_angle, ["multiply",1.5]]);

	actor_buff_apply("speed_raw", 1.5*SEC, [600*PPS], "mana_speed_boost")
	entity_push_motion(my_attack_dash_range*channel_multiplier_dash, (my_attack_dash_speed/(my_attack_dash_range*PPS))*SEC, bullet.bullet_action_move_angle - 180, ["multiply",1.25], "move_motion")
	
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = my_attack_cooldown_value;
}