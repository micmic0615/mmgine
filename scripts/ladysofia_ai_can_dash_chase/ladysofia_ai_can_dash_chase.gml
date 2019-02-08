if(entity_room_age_modulo(0.25*SEC)){
	if (
		action_shoot[?"sequence"] == 0 &&
		action_barrage[?"sequence"] == 0 &&
		action_strike[?"sequence"] == 0
	){
		action_dash_trigger([ai_target.x, ai_target.y]);
	}
}

entity_move_point([ai_target.x,ai_target.y]);