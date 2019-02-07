var me = id;
if (entity_room_age_modulo(my_shoot_vacuum_interval)){
	with(ACTOR){
		
		if (me.player_faction != player_faction){
			var distance = distance_between(x,y,me.x,me.y);
			if (distance < me.my_shoot_vacuum_range){
				if (distance > me.my_shoot_vacuum_range_min){
					entity_motion_push(me.my_shoot_vacuum_pull, me.my_shoot_vacuum_speed, angle_between(me.x,me.y,x,y))
				} else {
					entity_motion_push(me.my_shoot_vacuum_pull*0.5, me.my_shoot_vacuum_speed, angle_between(x,y,me.x,me.y))
				}
			}
		}
	}
}