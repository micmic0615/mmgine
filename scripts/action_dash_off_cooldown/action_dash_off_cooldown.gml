var dash_off_cooldown = false;
for(var i = 0; i < array_length_1d(action_dash_cooldown_multi_timer);i++){
	var p = action_dash_cooldown_multi_timer[i];
	if (p <= 0){dash_off_cooldown = true}
};

return dash_off_cooldown;