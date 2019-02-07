var target_point = argument[0];
var can_dash = action_generic_trigger(action_dash, target_point);
var did_dash = false;

var cooldown_remaining = action_dash_cooldown_check();
if (can_dash){
	if (cooldown_remaining <= 0){
		did_dash = true;
		if (action_dash[?"sequence"] == 0){		
			action_dash[?"cast_timer"] = action_dash[?"cast_value"];	
			action_dash[?"sequence"] = 1;
			actor_actions_id = "dash";
		}
	} else if (cooldown_remaining < 0.25*SEC){
		action_dash[?"queue_active"] = true;
		action_dash[?"queue_angle"] = angle_between(target_point[0], target_point[1], x, y);
	}
} else {
	if (cooldown_remaining < 0.25*SEC){
		action_dash[?"queue_active"] = true;
		action_dash[?"queue_angle"] = angle_between(target_point[0], target_point[1], x, y);
	}
}

return did_dash;