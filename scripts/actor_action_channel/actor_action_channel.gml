if (actor_actions_enabled){
	var argument_array = argument0;
	actor_record_replay_data("action_channel", argument_array);
	entity_run_type_scripts("action_channel", argument_array);
}