var target_point = argument0;

if (actor_actions_enabled && actor_actions_idle && action_shoot_backswing_timer <= 0 && action_shoot_cooldown_timer <= 0){
	if (action_shoot_step_phase <= 1){
		action_shoot_target_point = target_point;
		action_shoot_target_angle = point_direction(x,y,target_point[0],target_point[1]);
	}
	
	if (action_shoot_step_phase == 0){
		action_shoot_cast_timer = action_shoot_cast_value;
		action_shoot_backswing_timer = 0;
		action_shoot_step_phase = 1;
		actor_actions_id = "shoot";
	}
}