var action_map = argument[0];
var back_interval = 0.1*SEC
if (action_map[?"cast_timer"] < action_map[?"cast_aim_limit"]){
	if (entity_room_age_modulo(0.1*SEC)){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 0.5*SEC,
			/*blend*/ my_strike_color,
			/*style_data*/ [
				120,
				40,
				0.75
			]
		);
	}
	
	if(entity_room_age_modulo(back_interval)){
		var target_point = action_map[?"target_point"];
		var back_angle = angle_between(x,y,target_point[0],target_point[1]);
		entity_motion_push(60, back_interval*2, back_angle);
	}
} else {
	if(entity_room_age_modulo(back_interval)){
		var target_point = action_map[?"target_point"];
		var back_angle = angle_between(x,y,target_point[0],target_point[1]);
		entity_motion_push(10, back_interval*2, back_angle);
	}
}