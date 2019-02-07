if (ai_step_attack_else_wander()){
	ai_target_attack_should_channel = action_shoot_trigger([ai_target.x,ai_target.y]);
} else {
	if (action_shoot[?"cooldown_timer"] <= (0.5*SEC) && actor_actions_enabled){
		ai_target = ai_get_target("near", "enemy", enemy_attack_range_threat);
		if (ai_target != noone){
			ai_target_move_point = [ai_target.x,ai_target.y]
		}
	}
	
	entity_move_point(ai_target_move_point);
}

