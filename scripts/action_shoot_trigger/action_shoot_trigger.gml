var target = argument[0];
var did_shoot = action_generic_trigger(action_shoot, target);

if (did_shoot){
	if (action_shoot[?"sequence"] == 0){	
		action_shoot[?"cast_timer"] = action_shoot[?"cast_value"];	
		action_shoot[?"sequence"] = 1;
		actor_actions_id = "shoot";
	}
}

return did_shoot;