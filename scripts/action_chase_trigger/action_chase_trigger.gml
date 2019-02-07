var target_entity = argument[0];
var did_chase = action_generic_trigger(action_chase, target_entity);

if (did_chase){
	if (action_chase[?"sequence"] == 0){
		entity_run_type_scripts("action_chase_trigger", action_chase);
		action_chase[?"cast_timer"] = action_chase[?"cast_value"];	
		action_chase[?"sequence"] = 1;
		actor_actions_id = "chase";
	}
}

return did_chase;