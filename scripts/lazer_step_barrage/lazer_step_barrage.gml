var target_point = my_barrage_target_point;
var target_angle = angle_between(my_barrage_target_point[0], my_barrage_target_point[1], x,y);

if (my_barrage_active){
	physics_gravity_current = 0;
	
	if (actor_actions_enabled){
		if (my_barrage_cast_timer > 0){
			my_barrage_cast_timer -= TIMESPEED;
			animation_name = "channel";	
			my_barrage_angle_active = angle_shift(my_barrage_angle_active, target_angle, my_barrage_angle_turn_rate_cast)
		} else if (my_barrage_channel_timer > 0){
			entity_move_point(target_point);
			my_barrage_channel_timer -= TIMESPEED;
			animation_name = "attack";
			my_barrage_angle_active = angle_shift(my_barrage_angle_active, target_angle, my_barrage_angle_turn_rate_channel)
			
			actor_buff_apply("speed_bonus_percent", 2, [100], "speed_bonus_fire");
			
			actor_buff_apply("armor_poise", 2, [-500], "armor_penalty_fire");
		} else {
			my_barrage_active = false;
			my_barrage_cooldown_timer = my_barrage_cooldown_value;
		}
		
		var rad_angle = degtorad(my_barrage_angle_active)
		target_point = [
			x + cos(rad_angle)*10,
			y + sin(rad_angle)*10,
		];
		
		var shoot_angle = point_direction(x,y,target_point[0],target_point[1]);
		var compute_flip = (shoot_angle <= 90 && shoot_angle >= 0) || (shoot_angle <= 360 && shoot_angle >= 270)
		var action_angle = compute_flip ? shoot_angle : shoot_angle - 180;
		var action_direction = compute_flip ? 1 : -1;
		
		animation_angle = action_angle;
		animation_direction = action_direction;
	} else {
		my_barrage_active = false;
		my_barrage_cooldown_timer = my_barrage_cooldown_value;
	}
} else {
	if (my_barrage_cooldown_timer > 0){
		my_barrage_cooldown_timer -= TIMESPEED
	}
}

if (my_barrage_active && my_barrage_channel_timer > 0 && my_barrage_cast_timer <= 0){
	var spawn_interval = 0.35*SEC;
	if (entity_room_age_modulo(spawn_interval)){
		var bullet_x = (cos(degtorad(my_barrage_angle_active))*(my_barrage_bullet_radius*0.5)) + x;
		var bullet_y = (sin(degtorad(my_barrage_angle_active))*(my_barrage_bullet_radius*0.5)) + y;
	
		var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x, bullet_y, my_barrage_bullet_type[0]);
		var bullet_radius = my_barrage_bullet_radius;
		
		//var hero = ROOM.player_main_actor;
		//if (entity_enabled(hero)){
		//	ROOM.entity_collisions_validate = true;
		//	ROOM.entity_collisions_faction = hero.player_faction;
		//}		
	
		var one_second = SEC;
		//if (my_chase_jump_mirage_timer > 0){one_second = spawn_interval}
		ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total, true, "main_attack"]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", status_flinch_total]);
		
		ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", -40, 0.75*SEC, "origin", ["multiply",1.5]]);
	
		//var bullet_range = my_chase_jump_mirage_timer > 0 ? my_chase_bullet_range*2 : my_chase_bullet_range;
		//var bullet_speed = my_chase_bullet_speed + my_chase_movespeed_set;
		//if (my_chase_jump_mirage_timer > 0){bullet_speed += my_chase_jump_speed}
		//var bullet_radius = my_chase_jump_mirage_timer > 0 ? my_chase_bullet_radius*3 : my_chase_bullet_radius;
		
		var bullet_speed = my_barrage_bullet_speed + status_movespeed_total;
		
		bullet.animation_sprite = my_barrage_bullet_type[1];
		bullet.status_movespeed_base = bullet_speed;
		//bullet.collision_enabled_bullets = false;
		bullet.bullet_lifespan = my_barrage_bullet_range/bullet_speed;
		bullet.status_movesnap_base = 0.1*SEC;
		bullet.bullet_action_move_angle = my_barrage_angle_active;
		bullet.collision_destroy_value_max = INFINITY;
		bullet.collision_destroy_value_current = INFINITY;
		bullet.bullet_collision_tile_action = "die";
		bullet.physics_gravity_on = false;
		bullet.image_xscale = (bullet_radius*2)/sprite_get_width(sprite_index);
		bullet.image_yscale = (bullet_radius*2)/sprite_get_height(sprite_index);
		bullet.bullet_seek_range = 360;
		bullet.bullet_seek_turn_rate = 120*PPS;
		bullet.bullet_seek_angle_limit = 90;
		bullet.bullet_death_spawn[?"type"] = noone;
	
		entity_motion_push(80, 0.5*SEC, my_barrage_angle_active - 180, ["multiply", 1.5])

		ds_list_add(
			bullet.draw_particle_list, 
			[game_particle_setup_basic(my_barrage_color, 3 + random(5), 0.5, 0.25*SEC), 24, bullet_radius]
		);
				
		ds_list_add(
			bullet.draw_particle_list, 
			[game_particle_setup_basic(c_white, 1 + random(3), 0.25, 0.15*SEC), 18, bullet_radius*0.5]
		);
	}
}