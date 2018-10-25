if (player_controllable){
	var me = id;
	with(ACTOR){
		if (entity_type_lower == me.player_main_actor_type){
			me.camera_target_x = x;
			me.camera_target_y = y;
		}
		
		if (player_faction == me.player_faction){
			if (keyboard_check(global.key_up)){
				actor_move_angle(270)
			}
			
			if (keyboard_check(global.key_down)){
				actor_move_angle(90)
			}
			
			if (keyboard_check(global.key_right)){
				actor_move_angle(0)
			}
			
			if (keyboard_check(global.key_left)){
				actor_move_angle(180)
			}
		}
	}
}