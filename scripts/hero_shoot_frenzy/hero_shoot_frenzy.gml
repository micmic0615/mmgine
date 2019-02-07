action_shoot[?"backswing_value"] = my_shoot_backswing_value;
action_shoot[?"cooldown_value"] = my_shoot_cooldown_value;
action_shoot[?"channel_value"] = my_shoot_channel_value
if (my_frenzy_timer > 0){
	action_shoot[?"backswing_value"] = floor(action_shoot[?"backswing_value"]*0.5);
	action_shoot[?"cooldown_value"] = floor(action_shoot[?"cooldown_value"]*0.5);
	action_shoot[?"channel_value"] = ceil(action_shoot[?"channel_value"]*0.5);
}