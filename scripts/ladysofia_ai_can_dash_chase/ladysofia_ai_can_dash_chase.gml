if(entity_room_age_modulo(0.25*SEC)){
	if (actor_actions_idle_total){
		action_dash_trigger([ai_target.x, ai_target.y]);
	}
}

entity_move_point([ai_target.x,ai_target.y]);