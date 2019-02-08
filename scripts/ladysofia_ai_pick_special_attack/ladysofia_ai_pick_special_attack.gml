var my_chase_random = random(100);
		
switch(ai_last_chase){
	case "strike":
		if (my_chase_random < 40){
			ladysofia_action_shoot_melee_trigger(action_chase[?"target_entity"]); 
			ai_last_chase = "shoot";
		} else if (my_chase_random < 60) {
			action_strike_trigger(action_chase[?"target_entity"])
			ai_last_chase = "strike";
		} else {
			action_barrage_trigger(action_chase[?"target_entity"]);
			ai_last_chase = "barrage";
		};
		break
				
	case "barrage":
		if (my_chase_random < 50){
			ladysofia_action_shoot_melee_trigger(action_chase[?"target_entity"]); 
			ai_last_chase = "shoot";
		} else {
			action_strike_trigger(action_chase[?"target_entity"])
			ai_last_chase = "strike";
		} 
		break
	
	case "shoot":
	default:
		if (my_chase_random < 35){
			ladysofia_action_shoot_melee_trigger(action_chase[?"target_entity"]); 
			ai_last_chase = "shoot";
		} else if (my_chase_random < 70) {
			action_strike_trigger(action_chase[?"target_entity"])
			ai_last_chase = "strike";
		} else {
			action_barrage_trigger(action_chase[?"target_entity"]);
			ai_last_chase = "barrage";
		};
		break
}
