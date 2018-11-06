if (my_attack_cooldown_timer <= 0){
	var target_point = argument0;
	var target_angle = point_direction(x,y,target_point[0],target_point[1]);
	my_attack_channel_angle_warning = angle_between(target_point[0],target_point[1], x,y)
	my_attack_channel_ongoing = 2;
	my_attack_channel_angle_target = target_angle;
}
