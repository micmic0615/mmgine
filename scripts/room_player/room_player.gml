var me = id;
with(ACTOR){
	if (entity_type_lower == me.player_main_actor_type){
		me.camera_target_x = x;
		me.camera_target_y = y;
	}
}

if (player_controllable && global.replay_mode == "record"){
	with(ACTOR){
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
				actor_action_attack_1([mouse_x, mouse_y]);
			}
			
			if (mouse_check_button_pressed(global.mouse_2)){
				actor_action_attack_2([mouse_x, mouse_y]);
			}
			
			if (keyboard_check_pressed(global.key_action_1)){
				with(me){room_change_timespeed(0.25)};
			}
			
			if (keyboard_check_released(global.key_action_1)){
				with(me){room_change_timespeed(1)};
			}
			
			if (keyboard_check_pressed(global.key_replay_load)){
				global.replay_mode = "play";
				global.replay_duration = me.room_age_real;
				room_goto(global.next_room);
			}
		}
	}
} else {
	if (keyboard_check_pressed(global.key_replay_load)){
		global.replay_mode = "record";
		room_goto(global.next_room);
	}
	
	if (keyboard_check_pressed(global.key_pause)){
		global.replay_mode = "play";
		room_goto(global.next_room);
	}
}