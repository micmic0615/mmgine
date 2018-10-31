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
	#region //BUFF CALCULATE STATS
		actor_actions_enabled = true;

		var buff_list_length = ds_list_size(status_buff_list);
		for(var i = 0; i < buff_list_length;i++){actor_buff_process_1(ds_list_find_value(status_buff_list, i))};
		for(var i = 0; i < buff_list_length;i++){actor_buff_process_2(ds_list_find_value(status_buff_list, i))};
		for(var i = 0; i < buff_list_length;i++){actor_buff_process_3(ds_list_find_value(status_buff_list, i))};
		for(var i = 0; i < buff_list_length;i++){actor_buff_process_4(ds_list_find_value(status_buff_list, i))};
	
		for(var i = 0; i < buff_list_length;i++){
			var p = ds_list_find_value(status_buff_list, i);
			var type = p[0];
			var duration = p[1];
			var arguments = p[2];
			var buff_id = p[3];
			if (duration < INFINITY){
				ds_list_replace(status_buff_list, i, [
					type,
					duration - TIMESPEED,
					arguments,
					buff_id
				])
			}
		}
	#endregion
	
	#region // BUFF COSMETICS
		var has_speed = 0;
		var has_stunned = 0;
		for(var i = 0; i < buff_list_length;i++){
			var p = ds_list_find_value(status_buff_list, i);
			var type = p[0];
			var duration = p[1];
			
			if (has_speed == 0 && (type == "speed_raw" || type == "speed_percent")){
				has_speed = duration;
			}
			
			if (has_stunned == 0 && type == "stunned"){
				animation_name = "stunned";
				animation_angle = 0;
				animation_direction = 1;
			}
		}
	
		if (has_speed > 0){
			if (animation_name == "walk"){animation_name = "dash"};
			if (floor(entity_age) % (0.15*SEC) == 0){entity_mirage_create(1*SEC, 0, 0, make_color_rgb(0,255,255))};
		}
	#endregion	
	
	#region // BUFF REMOVE
		for(var i = 0; i < buff_list_length;i++){
			var p = ds_list_find_value(status_buff_list, i);
			if (p != undefined){
				var duration = p[1];
				show_debug_message(duration)
				if (duration <= 0){ds_list_delete(status_buff_list, i)}
			}
		}
	#endregion
#endregion

