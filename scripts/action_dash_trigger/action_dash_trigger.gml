var target_point = argument0;
var did_dash = false;

if (actor_actions_enabled && actor_actions_idle && action_dash_channel_timer <= 0 && action_dash_off_cooldown()){
	action_dash_channel_timer = action_dash_channel_value;
	action_dash_combo_timer = action_dash_cooldown_value;
	action_dash_combo_count++;
	
	for(var i = 0; i < array_length_1d(action_dash_cooldown_multi_timer);i++){
		var p = action_dash_cooldown_multi_timer[i];
		if (p <= 0){action_dash_cooldown_multi_timer[i] = action_dash_cooldown_value; break}
	};
	
	
	actor_actions_idle = false;
	entity_run_type_scripts("action_dash", target_point);
	
	actor_actions_id = "dash";
	var bullet_angle = angle_between(x,y, target_point[0], target_point[1]);
	entity_motion_push((action_dash_range), action_dash_range/action_dash_speed, bullet_angle  -180, ["multiply",1.25], "move_motion");
	did_dash = true;
} else {
	if (!action_dash_off_cooldown()){
		var lowest = INFINITY
		for(var i = 0; i < array_length_1d(action_dash_cooldown_multi_timer);i++){
			var p = action_dash_cooldown_multi_timer[i];
			if (p < lowest){lowest = p}
		};
		
		if (lowest <= action_dash_cooldown_value*0.25){
			action_dash_queue_angle = degtorad(angle_between(target_point[0],target_point[1],x,y ));
			action_dash_queue_cast = true;
		}
	}
}

return did_dash;