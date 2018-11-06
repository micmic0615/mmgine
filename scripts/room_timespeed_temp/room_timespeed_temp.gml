if (global.replay_mode == "record"){
	global.time_change_value = argument[0];
	global.time_change_duration = argument[1];
	if (argument_count >= 3){global.time_change_gradient = argument[2]}
}