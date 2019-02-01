if (my_attack_channel_ongoing > 0 || my_attack_cast_timer > 0){
	var rad_angle = degtorad(my_attack_channel_angle_warning)
	var attack_range = max(0, my_attack_channel_range_warning - (100 + random(400)));
	var limit_x = x + cos(rad_angle)*attack_range;
	var limit_y = y + sin(rad_angle)*attack_range;
	
	var thickness = my_attack_cast_timer > 0 ? (2 + random(1)) : 1 + random(1);
	var gb_color = my_attack_cast_timer > 0 ? 0 : (255 - ((my_attack_channel_power_current/my_attack_channel_power_max)*255)); 
	var line_color = make_color_rgb(255, gb_color, 0)
	
	draw_set_alpha(random(1));
	draw_line_width_color(x,y,limit_x, limit_y, thickness, line_color, line_color);
	draw_set_alpha(1);
}
