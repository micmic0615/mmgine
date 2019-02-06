var target_point = argument0;
var is_shooting = false;

if (actor_actions_enabled && actor_actions_idle && action_barrage_cooldown_timer <= 0){
	is_shooting = true;
	actor_actions_id = "barrage";
	action_barrage_target_point = target_point;
	if (!action_barrage_active){
		action_barrage_active = true;
		action_barrage_angle_active = angle_between(target_point[0],target_point[1],x,y)
		action_barrage_cast_timer = action_barrage_cast_value;
		action_barrage_channel_timer = action_barrage_channel_value;
	} 
}

return is_shooting