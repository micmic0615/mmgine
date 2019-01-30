if (actor_actions_enabled){
	if (action_dash_channel_timer >= 0){
		action_dash_channel_timer -= TIMESPEED;
		
		var floor_age = floor(ROOM.room_age_game);
		var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
		if (floor_age != next_floor_age && floor_age % (0.04*SEC) == 0){
			entity_mirage_create(0.4*SEC, 0, 0, action_dash_flair_color);
		}
		
		animation_name = "dash";
	} else {
		actor_actions_idle = true;
		if (actor_actions_id == "dash"){
			actor_actions_id = "none"
		}
	}
	
	if (action_dash_queue_cast && actor_actions_idle && action_dash_cooldown_timer <= 0){
		var target_point = [
			x + cos(action_dash_queue_angle)*INFINITY,
			y + sin(action_dash_queue_angle)*INFINITY,
		]
		action_dash_trigger(target_point);
		action_dash_queue_cast = false;
	}
} else {
	action_dash_channel_timer = 0;
}

if (action_dash_channel_timer <= 0 && action_dash_cooldown_timer > 0){
	action_dash_cooldown_timer -= TIMESPEED;
}

if (action_dash_combo_timer > 0){
	action_dash_combo_timer -= TIMESPEED;
} else if (action_dash_combo_count > 0){
	action_dash_combo_count = 0
}