if (entity_enabled()){
	var value_push_distance = argument[0];
	var value_push_duration = argument[1];
	var value_push_angle = argument[2];
	var value_push_decay = (argument_count >= 4) ? argument[3] : ["none"];
	var value_push_id = (argument_count >= 5) ? argument[4] : undefined;
	var rad_angle = degtorad(value_push_angle);

	var x_move = cos(rad_angle)*value_push_distance/value_push_duration;
	var y_move = sin(rad_angle)*value_push_distance/value_push_duration;
	
	entity_motion_add(x_move, y_move, value_push_duration, value_push_decay, value_push_id)
}