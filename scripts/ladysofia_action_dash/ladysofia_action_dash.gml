if (action_chase_active_timer > 0){
	action_dash[?"speed"] = my_dash_speed*1.5;
	action_dash[?"range"] = my_dash_range*0.75;	
} else {
	action_dash[?"speed"] = my_dash_speed;
	action_dash[?"range"] = my_dash_range;
}