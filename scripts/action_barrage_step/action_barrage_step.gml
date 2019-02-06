var target_point = action_barrage_target_point;
var target_angle = angle_between(action_barrage_target_point[0], action_barrage_target_point[1], x,y);

if (action_barrage_active){
	physics_gravity_current = 0;
	
	if (actor_actions_enabled){
		if (action_barrage_cast_timer > 0){
			action_barrage_cast_timer -= TIMESPEED;
			animation_name = action_barrage_animation_channel;	
			action_barrage_angle_active = angle_shift(action_barrage_angle_active, target_angle, action_barrage_angle_turn_rate_cast);
		} else if (action_barrage_channel_timer > 0){			
			action_barrage_channel_timer -= TIMESPEED;
			animation_name = action_barrage_animation_attack;
			action_barrage_angle_active = angle_shift(action_barrage_angle_active, target_angle, action_barrage_angle_turn_rate_channel);		
			entity_run_type_scripts("action_barrage_channel", target_point);
		} else {
			action_barrage_active = false;
			action_barrage_cooldown_timer = action_barrage_cooldown_value;
		}
		
		var rad_angle = degtorad(action_barrage_angle_active)
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
		action_barrage_active = false;
		action_barrage_cooldown_timer = action_barrage_cooldown_value;
	}
} else {
	if (actor_actions_id == "barrage"){actor_actions_id = "none"}
	if (action_barrage_cooldown_timer > 0){
		action_barrage_cooldown_timer -= TIMESPEED
	}
}

if (action_barrage_active && action_barrage_channel_timer > 0 && action_barrage_cast_timer <= 0){
	if (entity_room_age_modulo(action_barrage_interval)){
		var bullet_x = (cos(degtorad(action_barrage_angle_active))*(action_barrage_bullet_radius*0.5)) + x;
		var bullet_y = (sin(degtorad(action_barrage_angle_active))*(action_barrage_bullet_radius*0.5)) + y;
	
		var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x, bullet_y, action_barrage_bullet_type[0]);
		var bullet_radius = action_barrage_bullet_radius;
	
		var one_second = SEC;
		ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*action_barrage_damage, true, "main_attack"]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", status_flinch_total*action_barrage_flinch]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", action_barrage_push, 0.75*SEC, "origin", ["multiply",1.5]]);
		
		var bullet_speed = action_barrage_bullet_speed + status_movespeed_total;
		
		bullet.animation_sprite = action_barrage_bullet_type[1];
		bullet.status_movespeed_base = bullet_speed;
		bullet.bullet_lifespan = action_barrage_bullet_range/bullet_speed;
		bullet.status_movesnap_base = 0.1*SEC;
		bullet.bullet_action_move_angle = action_barrage_angle_active + random_mirror(action_barrage_angle_chaos);
		bullet.collision_destroy_value_max = action_barrage_collision_destroy_value;
		bullet.collision_destroy_value_current = action_barrage_collision_destroy_value;
		bullet.bullet_collision_tile_action = "die";
		bullet.physics_gravity_on = false;
		bullet.image_xscale = (bullet_radius*2)/sprite_get_width(sprite_index);
		bullet.image_yscale = (bullet_radius*2)/sprite_get_height(sprite_index);
		bullet.bullet_seek_range = action_barrage_bullet_seek_range;
		bullet.bullet_seek_turn_rate = action_barrage_bullet_seek_turn_rate;
		bullet.bullet_seek_angle_limit = action_barrage_bullet_seek_angle_limit;
		bullet.bullet_death_spawn[?"type"] = noone;
	
		entity_motion_push(action_barrage_recoil, 0.5*SEC, action_barrage_angle_active - 180, ["multiply", 1.5])
		
		for(var i = 0; i < array_length_1d(action_barrage_particles);i++){
			var p = action_barrage_particles[i];
			ds_list_add(
				bullet.draw_particle_list, 
				p
			);
		}
	}
}