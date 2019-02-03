if (actor_buff_find("flinched") == undefined){
	if (action_chase_success){
		entity_run_type_scripts("action_chase_success");	
	} else {
		if (action_chase_active_timer > 0){
			action_chase_active_timer -= TIMESPEED;
			if (entity_enabled(action_chase_target)){
				entity_run_type_scripts("action_chase_active");
				if (entity_room_age_modulo(0.1*SEC)){					
					entity_mirage_create(0.25*SEC, 0, 0, action_chase_color, 0.5);
				}

				actor_buff_apply("movespeed_set_raw", 1, [action_chase_movespeed_set], "chase_movespeed");
				actor_buff_apply("movesnap_set_raw", 1, [action_chase_movesnap_set], "chase_movesnap");
		
				animation_name = "chase";
				entity_move_point([action_chase_target.x, action_chase_target.y])
			
				if (action_chase_distance > 0){
					if (!action_chase_target.status_immortal && distance_between(x,y,action_chase_target.x,action_chase_target.y) < action_chase_distance){
						action_chase_success = true;
						action_chase_active_timer = 0;
						action_chase_cooldown_timer = action_chase_cooldown_value;
					}
				}
			} else {
				action_chase_active_timer = 0;
				action_chase_cooldown_timer = action_chase_cooldown_value;
			}
	
		} else {
			if (action_chase_cooldown_timer > 0){
				action_chase_cooldown_timer -= TIMESPEED;
			}
		}
	}
} else {
	action_chase_success = false;
	action_chase_active_timer = 0;
}

