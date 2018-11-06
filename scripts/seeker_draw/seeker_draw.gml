if (my_attack_channel_ongoing > 0){
	var rad_angle = degtorad(my_attack_channel_angle_warning)
	var attack_range = my_attack_bullet_range * ( 1 + random(0.25))
	var limit_x = x + cos(rad_angle)*attack_range;
	var limit_y = y + sin(rad_angle)*attack_range;
	
	var thickness = ((my_attack_channel_power_current/my_attack_channel_power_max)*2) + random(1);
	var line_color = make_color_rgb(255 - ((my_attack_channel_power_current/my_attack_channel_power_max)*255), 0,255)
	
	draw_set_alpha(random(1));
	draw_line_width_color(x,y,limit_x, limit_y, thickness, line_color, line_color);
	draw_set_alpha(1);
}