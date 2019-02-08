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
		can_move = ladysofia_ai_manage_phases(can_move);
		if (can_move){
			var distance = distance_between(x,y,ai_target.x,ai_target.y);
			if (distance < 2200){
				switch(my_invoke_boss_phase){
					case 0: can_move = ladysofia_ai_fight_phase_0(can_move, distance); break
					case 1: can_move = ladysofia_ai_fight_phase_1(can_move, distance); break
					case 2: can_move = ladysofia_ai_fight_phase_2(can_move, distance); break
				}
				
			} else {
				can_move = false;
				action_chase_trigger(ai_target)
			}
		}
	}
}

if (can_move){
	entity_move_point(ai_target_move_point);
}