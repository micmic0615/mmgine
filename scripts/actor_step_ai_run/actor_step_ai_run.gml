if (ai_enabled && global.replay_mode == "record"){
	if (ai_delay <= 0){
		entity_run_type_scripts("ai_step")
	} else {
		ai_delay -= TIMESPEED;
	}
}