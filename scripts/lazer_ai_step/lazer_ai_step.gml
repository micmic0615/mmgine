if (ai_step_attack_else_wander()){
	ai_target_attack_should_channel = false;
	ai_target_attack_should_channel = action_barrage_trigger(ai_target);
} 

if (!ai_target_attack_should_channel){
	entity_move_point(ai_target_move_point);
}