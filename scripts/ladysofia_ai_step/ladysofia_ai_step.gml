var can_move = true;

if (action_chase[?"success"]){
	can_move = false;
	if (action_chase[?"target_entity"] != noone && entity_enabled(action_chase[?"target_entity"])){
		ladysofia_action_shoot_melee_trigger(action_chase[?"target_entity"]); 
	} else {
		action_chase[?"success"] = false;
	}
} else {	
	if (ai_step_attack_else_wander()){
		can_move = ladysofia_ai_phases(can_move);
		
		var distance = distance_between(x,y,ai_target.x,ai_target.y);
		
	}
}

if (can_move){
	entity_move_point(ai_target_move_point);
}