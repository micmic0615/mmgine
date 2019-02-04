if (ai_step_attack_else_wander()){
	ai_target_attack_should_channel = false;
	if (ai_limit_targeting(1)){
		ai_target_attack_should_channel = lazer_action_barrage([ai_target.x,ai_target.y]);
	
	};	
	
	
	
} 

if (!ai_target_attack_should_channel){
	entity_move_point(ai_target_move_point);
}