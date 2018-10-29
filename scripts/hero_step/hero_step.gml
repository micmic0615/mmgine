
var compute_flip = (my_attack_channel_angle_target <= 90 && my_attack_channel_angle_target >= 0) || (my_attack_channel_angle_target <= 360 && my_attack_channel_angle_target >= 270)
var action_angle = compute_flip ? my_attack_channel_angle_target : my_attack_channel_angle_target - 180;
var action_direction = compute_flip ? 1 : -1;
if (my_attack_cooldown_timer == 0){
	if (my_attack_channel_ongoing){
		animation_name = "channel";
		animation_angle = action_angle;
		animation_direction = action_direction;
		my_attack_channel_power_current = min(my_attack_channel_power_current + 1, my_attack_channel_power_max);
		
		var power_ratio = (my_attack_channel_power_current/my_attack_channel_power_max);
		actor_buff_apply("move_percent", 0.1*SEC, [100 - power_ratio*100], "channel_slow");
		entity_mirage_create(0.35*SEC, -25*power_ratio + random(50*power_ratio), -25*power_ratio + random(50*power_ratio), make_color_hsv(power_ratio >= 0.95 ? random(255) : 230,255,255))
	}
} else {
	animation_name = "attack";
	var compute_flip = (my_attack_channel_angle_target <= 90 && my_attack_channel_angle_target >= 0) || (my_attack_channel_angle_target <= 360 && my_attack_channel_angle_target >= 270)
	animation_angle = action_angle;
	animation_direction = action_direction;
	my_attack_cooldown_timer--;
}

my_attack_channel_ongoing = false