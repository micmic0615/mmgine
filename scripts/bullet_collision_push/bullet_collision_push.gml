if (entity_enabled()){
	var args = argument0;
	
	var target_class = args[1];
	var value_push_distance = args[2];
	var value_push_duration = args[3];
	var value_push_angle = args[4];
	var value_push_decay = (array_length_1d(args) >= 6) ? args[5] : ["none"];
	var rad_angle = 0;
	
	if (value_push_angle == "movement"){
		rad_angle = degtorad(bullet_action_move_angle);
	} else if (value_push_angle == "center"){
		rad_angle = 0
	}  else if (value_push_angle == "origin"){
		rad_angle = degtorad(bullet_action_move_angle);		
	} else if (is_real(value_push_angle)){
		rad_angle = degtorad(value_push_angle);
	}

	for(var i = 0; i < ds_list_size(collision_entities_connect);i++){
		var p = ds_list_find_value(collision_entities_connect, i);
		
		if (entity_enabled(p) && p.entity_class_lower == target_class){
			if ((target_class == "actor" && p.status_iframe == false) || target_class != "actor"){
				if (value_push_angle == "center"){
					rad_angle = degtorad(angle_between(p.x, p.y, x, y));
				} else if (entity_enabled(bullet_origin)){
					rad_angle = degtorad(angle_between(p.x, p.y, bullet_origin.x, bullet_origin.y))
				}
			
				var x_move = cos(rad_angle)*value_push_distance/value_push_duration;
				var y_move = sin(rad_angle)*value_push_distance/value_push_duration;
	
				with(p){
					entity_motion_add(x_move, y_move, value_push_duration, value_push_decay)
				}
			}
			
		}
	}
}
