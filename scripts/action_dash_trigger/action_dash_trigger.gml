var target_point = argument0;

if (actor_actions_enabled && actor_actions_idle && action_dash_channel_timer <= 0 && action_dash_cooldown_timer <= 0){
	action_dash_channel_timer = action_dash_channel_value;
	action_dash_combo_timer = action_dash_cooldown_rest;
	action_dash_combo_count++;
	
	if (action_dash_combo_count >= action_dash_combo_max){
		action_dash_cooldown_timer = action_dash_cooldown_rest;
	} else {
		action_dash_cooldown_timer = action_dash_cooldown_value;
	};
	
	actor_actions_idle = false;
	entity_run_type_scripts("action_dash", action_shoot_target_point);
	
	actor_actions_id = "dash";
	var bullet_angle = angle_between(x,y, target_point[0], target_point[1]);
	entity_motion_push((action_dash_range), (action_dash_speed/(action_dash_range*PPS))*SEC, bullet_angle  -180, ["multiply",1.25], "move_motion");
	
} else {
	if (action_dash_cooldown_timer <= action_dash_cooldown_value){
		action_dash_queue_angle = degtorad(angle_between(target_point[0],target_point[1],x,y ));
		action_dash_queue_cast = true;
	}
}