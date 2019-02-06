physics_gravity_current = 0;

if (my_chase_random == undefined){
	my_chase_random = random(100);
}

if (entity_enabled(action_chase_target)){
	if (my_chase_random > 50){
		action_shoot_trigger([action_chase_target.x,action_chase_target.y]);
		if (!my_chase_did_attack){
			if (action_shoot_cast_timer > 0 && action_dash_channel_timer <= 0){
				my_chase_did_attack = true
			}
		} else {
			
			
			if (action_shoot_channel_timer <= 0){
				action_chase_success = false;
			}
		}
	} else {
		action_barrage_trigger([action_chase_target.x,action_chase_target.y]);
		if (!my_chase_did_attack){
			if (action_barrage_cast_timer > 0 && action_dash_channel_timer <= 0){
				my_chase_did_attack = true
			}
		} else {
			if (action_barrage_channel_timer <= 0){
				action_chase_success = false;
			}
		}
	}
} else {
	action_chase_success = false;
}



//action_chase_success = false