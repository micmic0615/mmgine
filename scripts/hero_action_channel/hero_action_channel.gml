if (my_attack_cooldown_timer <= 0){
	var target_point = argument0;
	var target_angle = point_direction(x,y,target_point[0],target_point[1]);
	my_attack_channel_ongoing = true;
	//my_attack_channel_angle_target = angle_shift(my_attack_channel_angle_target, target_angle, 60*PPS);
	my_attack_channel_angle_target = target_angle;
}
