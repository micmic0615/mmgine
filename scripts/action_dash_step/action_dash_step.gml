action_generic_step(action_dash, "dash");

for(var i = 0; i < ds_list_size(action_dash[?"cooldown_multi_timer"]);i++){
	var p = ds_list_find_value(action_dash[?"cooldown_multi_timer"], i);
	ds_list_replace(action_dash[?"cooldown_multi_timer"], i, (p - TIMESPEED));
};

if (action_dash[?"queue_active"] && action_dash_cooldown_check() <= 0){
	action_dash[?"queue_active"] = false;
	var rad_angle = degtorad(action_dash[?"queue_angle"]);
	var target_point = [
		x + cos(rad_angle)*INFINITY,
		y + sin(rad_angle)*INFINITY,
	];
		
	action_dash_trigger(target_point);
}