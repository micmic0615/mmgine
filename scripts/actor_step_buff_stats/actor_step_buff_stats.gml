actor_actions_enabled = true;
status_armor_health = 0;
status_armor_poise = 0;
status_immortal = false;
status_iframe = false;
physics_time_local = 1;
status_damage_total = status_damage_base;
status_health_regen_total = status_health_regen_base;
status_poise_regen_total = status_poise_regen_base;

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
				
		var new_duration = (type == "untimed") ? duration - 1 : duration - TIMESPEED
		ds_list_replace(status_buff_list, i, [
			type,
			new_duration,
			arguments,
			buff_id
		])
	}
}
		
if (status_poise_freeze_timer > 0){
	status_poise_freeze_timer -= TIMESPEED
} else {
	status_poise_current = min(status_poise_max, status_poise_current + (status_poise_regen_total*TIMESPEED));
}
		
if (status_health_regen_total > 0){
	var total_regen = status_health_current + (status_health_regen_total*TIMESPEED);
	var floor_regen = floor(total_regen);
	status_health_regen_bank += (total_regen - floor_regen);
			
	while(status_health_regen_bank > 1){
		floor_regen += 1;
		status_health_regen_bank -= 1;
	}
			
	status_health_current = min(status_health_max, floor_regen);
}

for(var i = 0; i < buff_list_length;i++){
	var p = ds_list_find_value(status_buff_list, i);
	if (p != undefined){
		var duration = p[1];
		if (duration <= 0){ds_list_delete(status_buff_list, i)}
	}
}