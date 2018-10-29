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
	
	for(var i = 0; i < buff_list_length;i++){
		var p = ds_list_find_value(status_buff_list, i);
		var duration = p[1];
		if (duration <= 0){ds_list_delete(status_buff_list, i)}
	}
#endregion