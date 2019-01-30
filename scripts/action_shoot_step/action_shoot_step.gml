if (actor_actions_enabled){
	switch(action_shoot_step_phase){
		case 1:
			if (action_shoot_cast_timer > 0){
				action_shoot_cast_timer -= TIMESPEED;
			} else {
				if (actor_actions_id == "shoot"){
					actor_actions_idle = false;
					action_shoot_channel_timer = action_shoot_channel_value;
					action_shoot_cooldown_timer = action_shoot_cooldown_value;
					action_shoot_step_phase = 2;
					entity_run_type_scripts("action_shoot", action_shoot_target_point);
					animation_name = "attack";
					image_index = 0;
					action_shoot_fire();
				} else {
					action_shoot_channel_timer = 0;
					action_shoot_cooldown_timer = 0;
					action_shoot_step_phase = 0;
				}
			}; break
			
		case 2:
			if (action_shoot_channel_timer > 0){
				action_shoot_channel_timer -= TIMESPEED;
			} else {
				actor_actions_idle = true;
				action_shoot_backswing_timer = action_shoot_backswing_value;				
				action_shoot_step_phase = 3;
			}; break
		
		case 3:
			if (action_shoot_backswing_timer > 0){
				action_shoot_backswing_timer -= TIMESPEED;
			} else {
				action_shoot_step_phase = 0;
				actor_actions_id = "none";
			}; break;
	}
	
	if (action_shoot_queue_cast && actor_actions_idle && action_shoot_cooldown_timer <= 0 && action_shoot_step_phase == 3){
		var target_point = [
			x + cos(action_shoot_queue_angle)*INFINITY,
			y + sin(action_shoot_queue_angle)*INFINITY,
		];
		
		action_shoot_trigger_cancel(target_point);
		action_shoot_queue_cast = false;
	}
} else {
	action_shoot_cast_timer = 0;
	action_shoot_channel_timer = 0;
	action_shoot_backswing_timer = 0;
	action_shoot_cooldown_timer = 0;

	action_shoot_direction = 1;
	action_shoot_step_phase = 0;
	
	action_shoot_queue = false;
}

if (actor_actions_id == "shoot"){
	action_shoot_target_angle = point_direction(x,y,action_shoot_target_point[0],action_shoot_target_point[1]);
	var compute_flip = (action_shoot_target_angle <= 90 && action_shoot_target_angle >= 0) || (action_shoot_target_angle <= 360 && action_shoot_target_angle >= 270)
	var action_angle = compute_flip ? action_shoot_target_angle : action_shoot_target_angle - 180;
	var action_direction = compute_flip ? 1 : -1;
	
	switch(action_shoot_step_phase){
		case 1: 
			animation_name = "channel";
			break
			
		case 2: 
			animation_name = "attack";
			break
		case 3: 
			animation_name = "rest";
			break
	}
	
	animation_angle = action_angle;
	animation_direction = action_direction;
}

if (action_shoot_channel_timer <= 0 && action_shoot_cooldown_timer > 0){
	action_shoot_cooldown_timer -= TIMESPEED;
}

if (action_shoot_combo_timer > 0){
	action_shoot_combo_timer -= TIMESPEED;
} else if (action_shoot_combo_count > 0){
	action_shoot_combo_count = 0
}