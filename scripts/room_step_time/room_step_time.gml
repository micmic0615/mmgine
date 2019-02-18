if (global.time_change_duration > 0){
	if(global.time_change_gradient){
		var time_diff = (global.time_base - global.time_change_value);
		var time_delta = sqr(time_diff/global.time_change_duration);
				
		global.time_change_value += time_delta;
	}
			
	room_timespeed_set(global.time_change_value);
	global.time_change_duration -= 1;
} else {
			
	room_timespeed_set(global.time_base);
}