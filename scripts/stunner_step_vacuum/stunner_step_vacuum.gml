if (actor_actions_id == "shoot" && action_shoot_cast_timer > 0){
	var me = id;
	if (entity_room_age_modulo(my_vacuum_interval)){
		with(ACTOR){
			if (me.player_faction != player_faction && distance_between(x,y,me.x,me.y) < me.my_vacuum_range){
				entity_motion_push(me.my_vacuum_pull, me.my_vacuum_speed, angle_between(me.x,me.y,x,y))
			}
		}
	}
	
}