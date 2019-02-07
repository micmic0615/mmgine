var target = argument[0];
var did_strike = action_generic_trigger(action_strike, target);

if (did_strike){
	if (action_strike[?"sequence"] == 0){	
		entity_run_type_scripts("action_strike_trigger", action_strike);
		action_strike[?"cast_timer"] = action_strike[?"cast_value"];	
		action_strike[?"sequence"] = 1;
		actor_actions_id = "strike";
	}
}

return did_strike;