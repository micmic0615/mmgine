var controller_id = argument0;
var controller_hero = argument1;

with(controller_hero){
	if (entity_enabled() ){
		var vaxis = gamepad_axis_value(controller_id, gp_axislv);
		var haxis = gamepad_axis_value(controller_id, gp_axislh);
		
		var vaim = gamepad_axis_value(controller_id, gp_axisrv);
		var haim = gamepad_axis_value(controller_id, gp_axisrh);
		
		var aim_padding = 10000;
		
		var face_y = y + aim_padding*vaxis;
		var face_x = x + aim_padding*haxis;
		
		if (vaxis != 0 || haxis != 0){
			versus_should_aim = false;
		}
		
		
		if (vaim != 0 || haim != 0){
			versus_should_aim = true;
		}
		
		var me = id;
		var auto_angle = undefined;
		var assist_angle = undefined;
		var current_dis = INFINITY;
		with(ACTOR){
			if (entity_enabled() && id != me){
				var dis = distance_between(x,y,me.x,me.y);
				if (dis < current_dis ){
					current_dis = dis;
					
					if (dis < ROOM.player_auto_aim_range){
						auto_angle = degtorad(angle_between(x,y,me.x,me.y))
					}
					
					assist_angle = angle_between(x,y,me.x,me.y)
				}
			}
		}
		
		if (versus_should_aim){
			versus_aim_y = y + aim_padding*vaim;
			versus_aim_x = x + aim_padding*haim;
			my_shoot_target_mode = true;
			my_shoot_target_mode_y = versus_aim_y;
			my_shoot_target_mode_x = versus_aim_x;
			
			if (assist_angle != undefined){
				var current_aim = angle_between(x + aim_padding*haim,y + aim_padding*vaim,x,y);
				if (assist_angle - current_aim > 180){assist_angle -= 360}
				if (current_aim - assist_angle > 180){current_aim -= 360}
				
				
				if (abs(assist_angle - current_aim) < 30){
					var rad_angle = degtorad(assist_angle)
					versus_aim_y = y + aim_padding*sin(rad_angle);
					versus_aim_x = x + aim_padding*cos(rad_angle);
					my_shoot_target_mode_y = versus_aim_y;
					my_shoot_target_mode_x = versus_aim_x;
				}
			}
		} else {
			versus_aim_y = y + aim_padding*vaxis;
			versus_aim_x = x + aim_padding*haxis;
			my_shoot_target_mode = false;
			
			//if (auto_angle != undefined){
			//	versus_aim_y = y + aim_padding*sin(auto_angle);
			//	versus_aim_x = x + aim_padding*cos(auto_angle);
			//}
		}
		
		if (sign(vaxis) == 1){
			entity_move_angle(90)
		} else if (sign(vaxis) == -1){
			entity_move_angle(270)
		}
		
		if (sign(haxis) == 1){
			entity_move_angle(0)
		} else if (sign(haxis) == -1){
			entity_move_angle(180)
		}
		
		
		if (gamepad_button_check(controller_id, gp_shoulderr)){
			actor_action_1([versus_aim_x, versus_aim_y]);
		}
		
		if (gamepad_button_check(controller_id, gp_shoulderrb)){
			actor_action_2([versus_aim_x, versus_aim_y]);
		}
		
		if (
			gamepad_button_check_pressed(controller_id, gp_face4) ||
			gamepad_button_check_pressed(controller_id, gp_face1) || 
			gamepad_button_check_pressed(controller_id, gp_shoulderl) 
		){
			actor_action_3([face_x, face_y]);
		}
		
		if (
			gamepad_button_check_pressed(controller_id, gp_shoulderlb) 
		){
			actor_action_4([face_x, face_y]);
		}
		
	}
}