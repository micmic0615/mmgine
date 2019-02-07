action_shoot[?"backswing_value"] = my_shoot_backswing_value;
action_shoot[?"cooldown_value"] = my_shoot_cooldown_value;
action_shoot[?"channel_value"] = my_shoot_channel_value
if (my_frenzy_timer > 0){
	action_shoot[?"backswing_value"] = floor(my_shoot_backswing_value*my_frenzy_attack_speed_factor);
	action_shoot[?"cooldown_value"] = floor(my_shoot_cooldown_value*my_frenzy_attack_speed_factor);
	action_shoot[?"channel_value"] = ceil(my_shoot_channel_value*my_frenzy_attack_speed_factor);
}