var target_point = argument0;
var is_shooting = false;

if (actor_actions_enabled && actor_actions_idle && my_barrage_cooldown_timer <= 0){
	is_shooting = true;
	my_barrage_target_point = target_point;
	if (!my_barrage_active){
		my_barrage_active = true;
		my_barrage_angle_active = angle_between(target_point[0],target_point[1],x,y)
		my_barrage_cast_timer = my_barrage_cast_value;
		my_barrage_channel_timer = my_barrage_channel_value;
	} 
}

return is_shooting