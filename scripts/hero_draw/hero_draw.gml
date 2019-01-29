#region //charge bar
	var angle = my_charge_draw_angle + 180;
	var distance = 90;
	var radius = 10;
	
	draw_set_alpha(0.5)
	
	draw_set_color(make_color_hsv(color_get_hue(my_charge_color_1), color_get_saturation(my_charge_color_1)*0.25, color_get_value(my_charge_color_1)*0.1))
	draw_circle(x + (cos(degtorad(angle))*distance), y + (sin(degtorad(angle))*distance), radius, false);
	
	if (my_charge_meter_1 == my_charge_max){
		radius = 10 +  random(4);
	} else {
		radius = 10;
	}
	draw_set_color(my_charge_color_1)
	var charge_ratio = max(0, (my_charge_meter_1 - my_charge_min) / (my_charge_max - my_charge_min))
	draw_circle(x + (cos(degtorad(angle))*distance), y + (sin(degtorad(angle))*distance), radius*(charge_ratio), false)
	
	angle = my_charge_draw_angle;
	
	
	draw_set_color(make_color_hsv(color_get_hue(my_charge_color_2), color_get_saturation(my_charge_color_2)*0.25, color_get_value(my_charge_color_2)*0.1))
	draw_circle(x + (cos(degtorad(angle))*distance), y + (sin(degtorad(angle))*distance), radius, false);
	
	if (my_charge_meter_1 == my_charge_max){
		radius = 10 +  random(4);
	} else {
		radius = 10;
	}
	draw_set_color(my_charge_color_2)
	var charge_ratio = max(0, (my_charge_meter_2 - my_charge_min) / (my_charge_max - my_charge_min))
	draw_circle(x + (cos(degtorad(angle))*distance), y + (sin(degtorad(angle))*distance), radius*(charge_ratio), false)
	
	draw_set_alpha(1)
	
#endregion

if (my_shoot_aim_mode == true){
	var angle_mouse = degtorad(angle_between(mouse_x, mouse_y, x, y));
	draw_line_width_color(x + cos(angle_mouse)*120, y + sin(angle_mouse)*120, x + cos(angle_mouse)*my_shoot_bullet_range, y + sin(angle_mouse)*my_shoot_bullet_range, 1, my_shoot_flair_color, my_shoot_flair_color);
}