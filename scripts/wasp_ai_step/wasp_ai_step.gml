ai_target_attack_should_channel = false;
if (ai_step_attack_else_wander()){
	var me = id;
	var ai_chase_limit = 3;
	with(ACTOR){
		if (entity_enabled() && variable_instance_exists(id, "ai_type_id")){
			if (ai_type_id == me.ai_type_id && ai_target == me.ai_target && ai_target_attack_should_channel){
				ai_chase_limit--;				
			}
		}
	}
	
	ai_chase_limit--;
	if (ai_chase_limit >= 0){wasp_action_chase(ai_target)};	
	ai_target_attack_should_channel = (my_chase_active_timer > 0 || my_chase_fire);
}

if (!ai_target_attack_should_channel){
	entity_move_point(ai_target_move_point);
}
