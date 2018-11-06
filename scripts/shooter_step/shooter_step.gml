if (actor_actions_enabled){
	var compute_flip = (my_attack_channel_angle_target <= 90 && my_attack_channel_angle_target >= 0) || (my_attack_channel_angle_target <= 360 && my_attack_channel_angle_target >= 270)
	var action_angle = compute_flip ? my_attack_channel_angle_target : my_attack_channel_angle_target - 180;
	var action_direction = compute_flip ? 1 : -1;

	if (my_attack_cooldown_timer <=  0){
		if (my_attack_channel_ongoing > 0){
			physics_gravity_current = 0;
			animation_name = "channel";
			animation_angle = action_angle;
			animation_direction = action_direction;
			my_attack_channel_power_current = min(my_attack_channel_power_current + TIMESPEED, my_attack_channel_power_max);
		
			var power_ratio = (my_attack_channel_power_current/my_attack_channel_power_max);
			var power_quadroot = sqrt(sqrt(power_ratio));
			actor_buff_apply("move_set_percent", 0.1*SEC, [100 - (power_quadroot*100)], "channel_slow");
		}
	} else {
		my_attack_cooldown_timer -= TIMESPEED;
	
		if (my_attack_cast_timer > 0){
			animation_name = "attack";
			animation_angle = action_angle;
			animation_direction = action_direction;
			my_attack_cast_timer -= TIMESPEED;
			physics_gravity_current = 0;
			entity_mirage_create(0.4*SEC, 0, 0, make_color_rgb(100,100,100))
		}
	}

	my_attack_channel_ongoing -= 1;
} else {
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = 0;
	my_attack_channel_ongoing = 0;
}