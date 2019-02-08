var target = argument[0];
var did_invoke = action_generic_trigger(action_invoke, target);

if (did_invoke){
	if (action_invoke[?"sequence"] == 0){	
		entity_run_type_scripts("action_invoke_trigger", action_invoke);
		action_invoke[?"cast_timer"] = action_invoke[?"cast_value"];	
		action_invoke[?"sequence"] = 1;
		actor_actions_id = "invoke";
	}
}

return did_invoke;