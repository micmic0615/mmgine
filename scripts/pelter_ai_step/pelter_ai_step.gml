if (my_attack_cast_timer > 0){
	if (ai_target != noone && instance_exists(ai_target)){
		my_attack_pelter_angle = angle_shift(my_attack_pelter_angle, angle_between(ai_target.x, ai_target.y, x, y), 45*PPS)
	}
} else {
	shooter_ai_step();
}


