if (!status_immortal){
	if (action_autoshield[?"cooldown_timer"] > 0){
		action_autoshield[?"cooldown_timer"] -= TIMESPEED;
	}

	if (action_autoshield[?"grit_cooldown_timer"] > 0){
		action_autoshield[?"grit_cooldown_timer"] -= TIMESPEED;
	}
	
	if (action_autoshield[?"active_timer"] > 0){
		action_autoshield[?"active_timer"] -= TIMESPEED
	} else {
		action_autoshield[?"active_bank"] = 0;
	}
} else {
	action_autoshield[?"active_timer"] = 0;
	action_autoshield[?"active_bank"] = 0;
}