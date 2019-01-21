var target_point = argument0;

if (my_attack_cooldown_timer <= 0){	
	my_attack_direction = 1;
	my_attack_queue_1 = undefined;
	image_index = 0;
	my_attack_channel_angle_target = point_direction(x,y,target_point[0],target_point[1]);
	
	var bullet_angle = angle_between(target_point[0], target_point[1], x,y);
	var bullet_spawn_offset = 0;
	
	var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
	var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
	
	var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x,bullet_y,DefaultBullet);

	bullet.status_movespeed_base = my_attack_bullet_speed*4;
	bullet.status_movesnap_base = 0.2*SEC;
	bullet.status_health_max = INFINITY;
	bullet.status_health_current = bullet.status_health_max;
	bullet.bullet_action_move_angle = bullet_angle;
	
	
	
	bullet.physics_gravity_on = false;
	
	bullet.image_xscale = 1.5;
	bullet.image_yscale = 1.5;
	
	var burst_range = my_attack_bullet_range*3
	
	bullet.animation_sprite = "SeekerBullet2";
		
	bullet.bullet_seek_range = 480;
	bullet.bullet_seek_turn_rate = 240*PPS;
	bullet.bullet_lifespan = ((((burst_range*PPS)/TIMESPEED)/bullet.status_movespeed_base)*SEC);
	bullet.bullet_collision_tile_action = "die";
	
	bullet.bullet_death_spawn[?"explosion_radius_min"] = 40;
	bullet.bullet_death_spawn[?"explosion_radius_max"] = 120;
	bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = make_color_rgb(255,0,255);
	bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;

	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*6, true]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", 500, 0.75*SEC, "movement", ["multiply",1.5]]);
	
	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "bullet", INFINITY, true]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
	
	entity_motion_push((my_attack_dash_range), (my_attack_dash_speed/(my_attack_dash_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
	
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = my_attack_cast_value*0.5;	
	my_attack_cast_timer = my_attack_cast_value*0.5;
}