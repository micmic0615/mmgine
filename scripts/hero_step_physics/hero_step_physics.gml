if (my_shoot_aim_mode){
	if (actor_actions_idle == true && actor_actions_id == "none"){
		
		
		var shoot_angle = point_direction(x,y,mouse_x,mouse_y);
		var compute_flip = (shoot_angle <= 90 && shoot_angle >= 0) || (shoot_angle <= 360 && shoot_angle >= 270)
		var action_angle = compute_flip ? shoot_angle : shoot_angle - 180;
		var action_direction = compute_flip ? 1 : -1;
		
		animation_angle = action_angle;
		animation_direction = action_direction;
		animation_name = "channel";
	}
	
	actor_buff_apply("move_set_raw", 0.1*SEC, [100*PPS], "aim_mode");
} 