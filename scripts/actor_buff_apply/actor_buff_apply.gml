if (entity_enabled()){
	var type = argument[0];
	var duration = argument[1];
	var arguments = argument[2];
	var buff_id = (argument_count >= 4) ? argument[3] : ("random_buff_id_" + string(random(INFINITY)) + "_" + string(random(INFINITY)) + "_" + string(random(INFINITY)));

	if (entity_enabled() && ds_exists(status_buff_list, ds_type_list)){
		var buff_id_unique = true
			
		var buff_list_length = ds_list_size(status_buff_list);
		for(var i = 0; i < buff_list_length;i++){
			var p = ds_list_find_value(status_buff_list, i);
			var list_buff_id = p[3];
	
			if (list_buff_id == buff_id){
				buff_id_unique = false;
				if (duration > p[1]){
					ds_list_replace(status_buff_list, i, [
						type,
						duration,
						arguments,
						buff_id
					])
				}
			}
		}

		if (buff_id_unique == true){
			if (type == "flinched"){
				ds_list_clear(physics_motion_list)
				var offset_angle = degtorad(270)
				if (duration <= status_flinch_duration){
					entity_draw_text_following("stunned!", [cos(degtorad(270))*40, sin(degtorad(270))*40], 1*SEC, c_white, 16);
				} else {	
					entity_draw_text_following("over-stun!", [cos(degtorad(270))*40, sin(degtorad(270))*40], 1*SEC, c_white, 16);
				}
				
			};
			
			ds_list_add(status_buff_list, [type, duration, arguments, buff_id])
		}
	}
}