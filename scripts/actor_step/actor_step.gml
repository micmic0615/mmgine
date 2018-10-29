entity_run_type_scripts("step");

#region //DRAW BARS
	var draw_bar_health_damage_speed = (20/100)*status_health_max*PPS;
	if (draw_bar_health_damage + draw_bar_health_damage_speed > status_health_current){
		draw_bar_health_damage -= draw_bar_health_damage_speed
	} else if (draw_bar_health_damage - draw_bar_health_damage_speed < status_health_current){
		draw_bar_health_damage += draw_bar_health_damage_speed
	} else {
		draw_bar_health_damage = status_health_current
	}
#endregion


#region // BUFF MANAGEMENT
	var buff_list_length = ds_list_size(status_buff_list);
	for(var i = 0; i < buff_list_length;i++){
		var p = ds_list_find_value(status_buff_list, i);
		
		var type = p[0];
		var duration = p[1];
		var arguments = p[2];
		var buff_id = p[3];
		
		actor_buff_process(p);
		
		if (duration < INFINITY){
			ds_list_replace(status_buff_list, i, [
				type,
				duration - 1,
				arguments,
				buff_id
			])
		}
	};
	
	#region // BUFF COSMETICS
		var has_speed = 0;
		for(var i = 0; i < buff_list_length;i++){
			var p = ds_list_find_value(status_buff_list, i);
			var type = p[0];
			var duration = p[1];
			
			if (has_speed == 0 && (type == "speed_raw" || type == "speed_percent")){
				has_speed = duration;
			}
		}
	
		if (has_speed > 0 && has_speed % (0.1*SEC) == 0){
			var mirage_push = [
				sprite_index,
				image_index,
				x,
				y,
				image_xscale,
				image_yscale,
				image_angle,
				image_blend,
				0.5,
				1*SEC,
				1*SEC
			];
		
			with(ROOM){ds_list_add(draw_mirage_list, mirage_push)}
		}
	#endregion	
	
	for(var i = 0; i < buff_list_length;i++){
		var p = ds_list_find_value(status_buff_list, i);
		var duration = p[1];
		if (duration <= 0){ds_list_delete(status_buff_list, i)}
	}
#endregion

