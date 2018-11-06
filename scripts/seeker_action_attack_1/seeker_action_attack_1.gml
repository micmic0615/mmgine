var me = id;
var count = 0;
with(BULLET){if (bullet_origin == me){count ++}};

var target_point = argument0;

if (my_attack_cooldown_timer <= 0 && count < my_attack_bullets_max){	
	my_attack_direction = 1;
	my_attack_queue_1 = undefined;
	image_index = 0;
	my_attack_channel_angle_target = point_direction(x,y,target_point[0],target_point[1]);
	
	var channel_multiplier_bullet = 0.5 + ((my_attack_channel_power_current/my_attack_channel_power_max)*1);
	var bullet_angle = angle_between(target_point[0], target_point[1], x,y);
	var bullet_spawn_offset = 0;
	
	var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
	var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
	
	var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x,bullet_y,SeekingBullet);

	bullet.status_movespeed_base = my_attack_bullet_speed;
	bullet.status_movesnap_base = 0.2*SEC;
	bullet.status_health_max = INFINITY;
	bullet.status_health_current = bullet.status_health_max;
	bullet.bullet_action_move_angle = bullet_angle;
	
	bullet.physics_gravity_on = false;
	
	bullet.seekingbullet_hit_take_size = 1;
	bullet.seekingbullet_hit_take_max = 4;
	bullet.seekingbullet_hit_take_current = 4;
	
	bullet.animation_sprite = "SeekerBullet1";
	
	bullet.collision_solid_entities = true;
		
	bullet.bullet_seek_range = INFINITY;
	bullet.bullet_seek_turn_rate = 120*PPS;
	bullet.bullet_seek_angle_limit = 360;
	bullet.bullet_lifespan = INFINITY;
	bullet.bullet_collision_tile_action = "die";
	
	with(bullet){
		entity_motion_push((me.my_attack_dash_range), (me.my_attack_dash_speed/(me.my_attack_dash_range*PPS))*SEC, bullet_angle, ["multiply",1.25], "move_motion");
	}

	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*channel_multiplier_bullet, false]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", INFINITY]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", 100*channel_multiplier_bullet , 0.75*SEC, "movement", ["multiply",1.5]]);
	
	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "bullet", INFINITY, true]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
	
	entity_motion_push((my_attack_dash_range), (my_attack_dash_speed/(my_attack_dash_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");
	
	actor_buff_apply("move_set_raw", my_attack_cast_value, [0], "mana_speed_lock");
	
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = my_attack_cooldown_value;	
	
	my_attack_cast_timer = my_attack_cast_value;
}