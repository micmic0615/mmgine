var dash_off_cooldown = INFINITY;

for(var i = 0; i < ds_list_size(action_dash[?"cooldown_multi_timer"]);i++){
	var p = ds_list_find_value(action_dash[?"cooldown_multi_timer"], i);
	if (p <= dash_off_cooldown){dash_off_cooldown = p};		
};

return dash_off_cooldown;