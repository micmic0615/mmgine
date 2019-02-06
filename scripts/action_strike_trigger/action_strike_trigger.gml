var target_point = argument0;
var did_strike = false;
if (actor_actions_enabled && actor_actions_idle && action_strike_backswing_timer <= 0 && action_strike_cooldown_timer <= 0){
	did_strike = true;
	if (action_strike_step_phase <= 1){
		action_strike_target_point = target_point;
		action_strike_target_angle = point_direction(x,y,target_point[0],target_point[1]);
	}
	
	if (action_strike_step_phase == 0){		
		entity_run_type_scripts("action_strike_cast", action_strike_target_point);
		action_strike_cast_timer = action_strike_cast_value;
		action_strike_backswing_timer = 0;
		action_strike_step_phase = 1;
		actor_actions_id = "strike";
	}
}

return did_strike