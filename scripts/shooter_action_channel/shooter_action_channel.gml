if (my_attack_cooldown_timer <= 0){
	var target_point = argument0;
	var target_angle = point_direction(x,y,target_point[0],target_point[1]);
	
	my_attack_channel_ongoing = 2;
	my_attack_channel_angle_target = angle_shift(my_attack_channel_angle_target, target_angle, my_attack_channel_turn_rate*TIMESPEED);
	
	var rad_angle = degtorad(my_attack_channel_angle_target)
	
	my_attack_channel_angle_warning = point_direction(x,y, x + cos(rad_angle)*10,y + sin(rad_angle)*10)
}
