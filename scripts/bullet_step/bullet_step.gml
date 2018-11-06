if (bullet_lifespan > 0){
	entity_run_type_scripts("step");

	if (status_movesnap_total > 0){
		entity_move_angle(bullet_action_move_angle)
	}
	
	var me = id;
	if (bullet_seek_range > 0){
		if (bullet_seek_target == noone){
			with(ENTITY){
				if (entity_collision_validate_entity(me, false)){
					var can_angle = angle_difference(me.bullet_action_move_angle, angle_between(x, y, me.x, me.y))				
					if (abs(can_angle) < 60){
						if (distance_between(me.x,me.y, x,y) <= me.bullet_seek_range){me.bullet_seek_target = id}
					}
					
				}
			}
		} else {
			if (instance_exists(bullet_seek_target)){
				var can_angle = angle_difference(bullet_action_move_angle, angle_between(bullet_seek_target.x,bullet_seek_target.y, x, y));
				if (abs(can_angle) < bullet_seek_angle_limit && distance_between(x,y, bullet_seek_target.x,bullet_seek_target.y) <= bullet_seek_range){
					var target_angle = angle_between(bullet_seek_target.x,bullet_seek_target.y, x, y)
					bullet_action_move_angle = angle_shift(bullet_action_move_angle, target_angle, bullet_seek_turn_rate);
					bullet_lifespan += TIMESPEED;
					
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
