var target_point = argument[0];
var did_strike = action_generic_trigger(action_strike, target_point);

if (did_strike){
	if (action_strike[?"sequence"] == 0){		
		action_strike[?"cast_timer"] = action_strike[?"cast_value"];	
		action_strike[?"sequence"] = 1;
		actor_actions_id = "strike";
	}
}

return did_strike;