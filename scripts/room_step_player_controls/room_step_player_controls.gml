var me = id;

if (player_controllable && global.replay_mode == "record"){
	if (player_main_actor != noone && instance_exists(player_main_actor)){
		player_controls_move_dash_timer_up -= 1;
		player_controls_move_dash_timer_down -= 1;
		player_controls_move_dash_timer_right -= 1;
		player_controls_move_dash_timer_left -= 1;
		with(player_main_actor){
			if (entity_enabled() ){
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
				
				if (keyboard_check(global.key_shift)){
					if (my_shoot_aim_dash_disable_timer <= 0){
						my_shoot_aim_mode = true;
					}
				} else {
					my_shoot_aim_mode = false;
				}
				
				if (keyboard_check(global.key_heal)){
					hero_action_heal()
				}
				
				//if (keyboard_check_pressed(global.key_up)){
				//	if (me.player_controls_move_dash_timer_up > 0){
				//		var rad_angle = degtorad(270);
				//		actor_action_3([x + (cos(rad_angle)*10), y + (sin(rad_angle)*10)]);
				//		me.player_controls_move_dash_timer_up = 0;
				//	} else {
				//		me.player_controls_move_dash_timer_up = me.player_controls_move_dash_timer_value;
				//	}
				//}
			
				//if (keyboard_check_pressed(global.key_down)){
				//	if (me.player_controls_move_dash_timer_down > 0){
				//		var rad_angle = degtorad(90);
				//		actor_action_3([x + (cos(rad_angle)*10), y + (sin(rad_angle)*10)]);
				//		me.player_controls_move_dash_timer_down = 0;
				//	} else {
				//		me.player_controls_move_dash_timer_down = me.player_controls_move_dash_timer_value;
				//	}
				//}
			
				//if (keyboard_check_pressed(global.key_right)){
				//	if (me.player_controls_move_dash_timer_right > 0){
				//		var rad_angle = degtorad(0);
				//		actor_action_3([x + (cos(rad_angle)*10), y + (sin(rad_angle)*10)]);
				//		me.player_controls_move_dash_timer_right = 0;
				//	} else {
				//		me.player_controls_move_dash_timer_right = me.player_controls_move_dash_timer_value;
				//	}
				//}
			
				//if (keyboard_check_pressed(global.key_left)){
				//	if (me.player_controls_move_dash_timer_left > 0){
				//		var rad_angle = degtorad(180);
				//		actor_action_3([x + (cos(rad_angle)*10), y + (sin(rad_angle)*10)]);
				//		me.player_controls_move_dash_timer_left = 0;
				//	} else {
				//		me.player_controls_move_dash_timer_left = me.player_controls_move_dash_timer_value;
				//	}
				//}
				
				if (keyboard_check_pressed(global.key_select_right)){
					hero_skill_set_shoot_select(1);
				}
				
				if (keyboard_check_pressed(global.key_select_left)){
					hero_skill_set_shoot_select(-1);
				}
				
				if (keyboard_check_pressed(global.key_select_down)){
					hero_skill_set_shoot_cycle(1);
				}
				
				if (keyboard_check_pressed(global.key_select_up)){
					hero_skill_set_shoot_cycle(-1);
				}
			
				if (mouse_check_button(global.mouse_1)){
					actor_action_1([mouse_x, mouse_y]);
				}
				
				if (mouse_check_button(global.mouse_2)){
					hero_action_2([mouse_x, mouse_y])
				}
				
				if (keyboard_check_pressed(global.key_action_1)){
					var rad_angle = degtorad(animation_angle);
					if (animation_direction == -1){
						rad_angle = degtorad(animation_angle - 180);
					}
					var new_angle = angle_between(x + (cos(rad_angle)*10), y + (sin(rad_angle)*-10), x, y);
					rad_angle = degtorad(new_angle);
					
					
					
					if (keyboard_check(global.key_up) && keyboard_check(global.key_right)){
						rad_angle = degtorad(315)
					} else if (keyboard_check(global.key_up) && keyboard_check(global.key_left)){
						rad_angle = degtorad(225)
					} else if (keyboard_check(global.key_down) && keyboard_check(global.key_right)){
						rad_angle = degtorad(45)
					} else if (keyboard_check(global.key_down) && keyboard_check(global.key_left)){
						rad_angle = degtorad(135)
					} else if (keyboard_check(global.key_up)){
						rad_angle = degtorad(270)
					} else if (keyboard_check(global.key_down)){
						rad_angle = degtorad(90)
					} else if (keyboard_check(global.key_right)){
						rad_angle = degtorad(0)
					} else if (keyboard_check(global.key_left)){
						rad_angle = degtorad(180)
					}
					
					actor_action_3([x + (cos(rad_angle)*INFINITY), y + (sin(rad_angle)*INFINITY)]);
				}
			}
		}
	}
	
	//if (keyboard_check_pressed(global.key_action_1)){
	//	room_timespeed_set(0.25);
	//}
			
	//if (keyboard_check_released(global.key_action_1)){
	//	room_timespeed_set(1);
	//}
	
	if (keyboard_check_pressed(global.key_replay_load)){
		//global.replay_mode = "play";
		//global.replay_duration = me.room_age_real;
		//global.random_index = 0;
		//global.actor_id_sequence = 0;
		global.time_base = 1;
		//room_goto(global.room_current);
		
		global.replay_mode = "record";
		global.random_index = 0;
		global.actor_id_sequence = 0;
		global.time_base = 1;
		ds_clear();
		room_goto(global.room_current);
	}	
} else {
	if (keyboard_check_pressed(global.key_replay_load)){
		global.replay_mode = "record";
		global.random_index = 0;
		global.actor_id_sequence = 0;
		global.time_base = 1;
		ds_clear();
		room_goto(global.room_current);
	}
	
	if (keyboard_check_pressed(global.key_pause)){
		global.replay_mode = "play";
		global.random_index = 0;
		global.actor_id_sequence = 0;
		global.time_base = 1;
		room_goto(global.room_current);
	}
}