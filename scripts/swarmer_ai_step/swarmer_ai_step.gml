if (my_clone_original){
	ai_target_attack_should_channel = false;
	if (ai_step_attack_else_wander()){

	}

	if (!ai_target_attack_should_channel){
		entity_move_point(ai_target_move_point);
	}
}