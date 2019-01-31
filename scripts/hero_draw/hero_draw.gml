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

var me = id;
var line_speed = 640*PPS;
var alpha_cycle = ROOM.room_age_real mod 0.25*SEC;

draw_set_alpha(0.4 + (0.06*alpha_cycle))

var room_diagonal_size = sqrt(sqr(window_get_width()) + sqr(window_get_height()));
for(var i = 0; i < ds_list_size(my_camera_threats);i++){
	var p = ds_list_find_value(my_camera_threats, i);
	var enemy = p[0];
	
	if (entity_enabled(enemy)){
		var refresh_drawing = false;
	
		//if (distance_between(x,y,enemy.x,enemy.y) > 240){
			
		
			if (entity_age - p[1] > 0){
				var duration_min = (line_speed*(entity_age - p[1])) + 40;
				var duration_max = duration_min + 30;
	
				var origin_x = p[2];
				var origin_y = p[3];
	
				var angle = degtorad(angle_between(enemy.x,enemy.y, origin_x,origin_y));
		
				var angle_x = cos(angle);
				var angle_y = sin(angle);
		
				var line_start_x = origin_x + (angle_x*duration_min);
				var line_start_y = origin_y + (angle_y*duration_min);
		
				var line_end_x = origin_x + (angle_x*duration_max);
				var line_end_y = origin_y + (angle_y*duration_max)
		
				if (!point_inside_camera((line_start_x + line_end_x)/2, (line_start_y + line_end_y)/2)){
					refresh_drawing = true
				} else {
					draw_line_width_color(line_start_x, line_start_y, line_end_x, line_end_y,2,c_red,c_red)
				}
	
				if (distance_between(enemy.x, enemy.y, line_end_x, line_end_y) < 80){
					refresh_drawing = true
				}
			}
		//} else {
		//	refresh_drawing = true
		//}
	
		if (refresh_drawing){
			ds_list_replace(my_camera_threats, i, [
				enemy,
				entity_age + (0.35*SEC),
				x,
				y
			])
		}
	}
}

draw_set_alpha(1);