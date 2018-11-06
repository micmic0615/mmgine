var me = id;

if (player_controllable && global.replay_mode == "record"){
	if (player_main_actor != noone && instance_exists(player_main_actor)){
		with(player_main_actor){
			if (ACTIVE && ALIVE ){
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
			}
		}
	}
	
	if (keyboard_check_pressed(global.key_action_1)){
		room_change_timespeed(0.25);
	}
			
	if (keyboard_check_released(global.key_action_1)){
		room_change_timespeed(1);
	}
	
	if (keyboard_check_pressed(global.key_replay_load)){
		global.replay_mode = "play";
		global.replay_duration = me.room_age_real;
		global.random_index = 0;
		global.actor_id_sequence = 0;
		room_goto(global.next_room);
	}	
} else {
	if (keyboard_check_pressed(global.key_replay_load)){
		global.replay_mode = "record";
		global.random_index = 0;
		global.actor_id_sequence = 0;
		ds_clear();
		room_goto(global.next_room);
	}
	
	if (keyboard_check_pressed(global.key_pause)){
		global.replay_mode = "play";
		global.random_index = 0;
		global.actor_id_sequence = 0;
		room_goto(global.next_room);
	}
}