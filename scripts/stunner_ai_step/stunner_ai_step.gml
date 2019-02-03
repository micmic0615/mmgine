if (ai_step_attack_else_wander()){
	ai_target_attack_should_channel = action_shoot_trigger([ai_target.x,ai_target.y]);
} else {
	entity_move_point(ai_target_move_point);
}

