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
			if (instance_exists(bullet_seek_target)){
				var can_angle = angle_difference(bullet_action_move_angle, angle_between(bullet_seek_target.x,bullet_seek_target.y, x, y));
				if (abs(can_angle) < bullet_seek_angle_limit && distance_between(x,y, bullet_seek_target.x,bullet_seek_target.y) <= bullet_seek_range){
					var target_angle = angle_between(bullet_seek_target.x,bullet_seek_target.y, x, y)
					bullet_action_move_angle = angle_shift(bullet_action_move_angle, target_angle, bullet_seek_turn_rate*TIMESPEED);
					
					if (distance_between(bullet_seek_target.x,bullet_seek_target.y, me.x,me.y) > 120){
						bullet_lifespan += TIMESPEED;
					}
					
					
					var floor_age = floor(ROOM.room_age_game);
					var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
					
					if (floor_age % (0.1*SEC) == 0 && floor_age != next_floor_age){
						entity_mirage_create(0.35*SEC, 0,0, make_color_rgb(100,100,100))
					};
				} else {
					bullet_seek_target = noone;
				}
			} else {
				bullet_seek_target = noone;
			}
		}
	}
	
	bullet_lifespan = bullet_lifespan == INFINITY ? bullet_lifespan : (bullet_lifespan - TIMESPEED);
} else {
	entity_kill(id);
}
