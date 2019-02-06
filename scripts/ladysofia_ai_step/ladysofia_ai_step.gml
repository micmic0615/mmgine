if (ai_step_attack_else_wander()){
	//ai_target_attack_should_channel = false;
	//ai_target_attack_should_channel = action_barrage_trigger([ai_target.x,ai_target.y]);
	
	action_chase_trigger(ai_target);	
	ai_target_attack_should_channel = (action_chase_active_timer > 0 || action_chase_success);
	
	//ai_target_attack_should_channel = action_shoot_trigger([ai_target.x,ai_target.y]);
};

if (!ai_target_attack_should_channel){
	entity_move_point(ai_target_move_point);
};