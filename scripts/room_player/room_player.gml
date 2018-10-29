if (player_controllable){
	var me = id;
	with(ACTOR){
		if (entity_type_lower == me.player_main_actor_type){
			me.camera_target_x = x;
			me.camera_target_y = y;
		}
		
		if (player_faction == me.player_faction){
			if (keyboard_check(global.key_up)){
				entity_move_angle(270)
			}
			
			if (keyboard_check(global.key_down)){
				entity_move_angle(90)
			}
			
			if (keyboard_check(global.key_right)){
				entity_move_angle(0)
			}
			
			if (keyboard_check(global.key_left)){
				entity_move_angle(180)
			}
			
			if (mouse_check_button(global.mouse_1)){
				actor_action_channel([mouse_x, mouse_y]);
			}
			
			if (mouse_check_button_released(global.mouse_1)){
				actor_action_attack([mouse_x, mouse_y]);
			}
		}
	}
}