var target_point = argument0;
var my_attack_combo_max = 4;

if (my_attack_cooldown_timer <= 0){	
	my_attack_direction = 1;
	my_attack_queue_1 = undefined;
	image_index = 0;
	my_attack_channel_angle_target = point_direction(x,y,target_point[0],target_point[1]);
	
	var channel_multiplier_bullet = 0.5 + ((my_attack_channel_power_current/my_attack_channel_power_max)*1);
	var bullet_angle = angle_between(target_point[0], target_point[1], x,y);
	var bullet_spawn_offset = 0;
	
	var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
	var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
	
	var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x,bullet_y,DefaultBullet);

	bullet.status_movespeed_base = my_attack_bullet_speed;
	bullet.status_movesnap_base = 0.2*SEC;
	bullet.status_health_max = INFINITY;
	bullet.status_health_current = bullet.status_health_max;
	bullet.bullet_action_move_angle = bullet_angle;
	
	bullet.physics_gravity_on = false;
	
	bullet.image_xscale = 1;
	bullet.image_yscale = 1;
	
	bullet.animation_sprite = "ShooterBullet1";
		
	bullet.bullet_seek_range = 300;
	bullet.bullet_seek_turn_rate = 90*PPS;
	bullet.bullet_lifespan = ((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*SEC);
	bullet.bullet_collision_tile_action = "die";
	
	bullet.bullet_death_spawn[?"explosion_radius_min"] = 30;
	bullet.bullet_death_spawn[?"explosion_radius_max"] = 120;
	bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = make_color_rgb(255,0,0);
	bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;

	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total, true]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", status_damage_total*0.5]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", 100*channel_multiplier_bullet , 0.75*SEC, "movement", ["multiply",1.5]]);
	
	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "bullet", INFINITY, true]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
	
	entity_motion_push((my_attack_dash_range), (my_attack_dash_speed/(my_attack_dash_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
	
	actor_buff_apply("move_set_raw", my_attack_cast_value, [0], "mana_speed_lock");
	
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = my_attack_cooldown_value;	
	
	my_attack_cast_timer = my_attack_cast_value;
}