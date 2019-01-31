ai_target_attack_should_channel = false;
if (ai_step_attack_else_wander()){
	wasp_action_chase(ai_target);
	ai_target_attack_should_channel = (my_chase_active_timer > 0);
}

if (!ai_target_attack_should_channel){
	entity_move_point(ai_target_move_point);
}
