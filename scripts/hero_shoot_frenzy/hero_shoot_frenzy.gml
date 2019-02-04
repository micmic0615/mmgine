action_shoot_backswing_value = my_shoot_backswing_value;
action_shoot_cooldown_value = my_shoot_cooldown_value;
action_shoot_channel_value = my_shoot_channel_value
if (my_frenzy_timer > 0){
	action_shoot_backswing_value = floor(action_shoot_backswing_value*0.5);
	action_shoot_cooldown_value = floor(action_shoot_cooldown_value*0.5);
	action_shoot_channel_value = ceil(action_shoot_channel_value*0.5);
}