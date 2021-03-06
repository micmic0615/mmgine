if (bullet_lifespan > 0){
	entity_run_type_scripts("step");

	if (status_movesnap_total > 0){
		entity_move_angle(bullet_action_move_angle)
	}
	
	if (bullet_origin_anchor == true && instance_exists(bullet_origin)){
		x = bullet_origin.x;
		y = bullet_origin.y;
	}
	
	var me = id;
	if (bullet_seek_range > 0){
		if (bullet_seek_target == noone){
			var lowest_distance = INFINITY;
			for(var i = 0; i < ds_list_size(collision_entities_valid);i++){
				var p = ds_list_find_value(collision_entities_valid, i);
				if (instance_exists(p)){
					var can_angle = angle_difference(bullet_action_move_angle, angle_between(p.x, p.y, x, y))				
					if (abs(can_angle) < bullet_seek_angle_limit){
						var current_distance = distance_between(x,y, p.x,p.y);
						if (current_distance <= bullet_seek_range && current_distance < lowest_distance){
							lowest_distance  = current_distance;
							bullet_seek_target = p
						}
					}
				}
			}
		} else {
			if (entity_enabled(bullet_seek_target)){
				var can_angle = angle_difference(bullet_action_move_angle, angle_between(bullet_seek_target.x,bullet_seek_target.y, x, y));
				if (abs(can_angle) < bullet_seek_angle_limit && distance_between(x,y, bullet_seek_target.x,bullet_seek_target.y) <= bullet_seek_range){
					var target_angle = angle_between(bullet_seek_target.x,bullet_seek_target.y, x, y)
					bullet_action_move_angle = angle_shift(bullet_action_move_angle, target_angle, bullet_seek_turn_rate*TIMESPEED);
					
					if (bullet_seek_no_decay == true){
						bullet_lifespan += TIMESPEED;
					}
					
					if (distance_between(bullet_seek_target.x,bullet_seek_target.y, me.x,me.y) < 40){
						bullet_seek_no_decay = false
					}
					
					var floor_age = floor(ROOM.room_age_game);
					var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
				} else {
					bullet_seek_target = noone;
				}
			} else {
				bullet_seek_target = noone;
			}
		}
	}
	
	if (bullet_collision_cooldown_value < INFINITY){
		if (bullet_collision_cooldown_timer > 0){
			bullet_collision_cooldown_timer -= TIMESPEED
		} else {
			ds_list_clear(collision_entities_exceptions)
			bullet_collision_cooldown_timer = bullet_collision_cooldown_value 
		}
	}
	
	bullet_lifespan = bullet_lifespan == INFINITY ? bullet_lifespan : (bullet_lifespan - TIMESPEED);
} else {
	entity_kill(id);
}
