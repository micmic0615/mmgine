if (action_clone_original){
	ai_target_attack_should_channel = false;
	if (ai_step_attack_else_wander()){
		if (ai_limit_targeting(1)){action_chase_trigger(ai_target)};	
		ai_target_attack_should_channel = (action_chase[?"channel_timer"] > 0);
	};

	if (!ai_target_attack_should_channel){
		entity_move_point(ai_target_move_point);
	};
}