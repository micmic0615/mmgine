//if (my_time_stop_channel){
//	var me = id;
//	with(BULLET){
//		if (bullet_origin == me){
//			bullet_seek_target = noone;
//			var rad_angle = degtorad(bullet_action_move_angle)
			
//			var random_distance = me.my_attack_bullet_range + random(me.my_attack_bullet_range)
			
//			var limit_x = (cos(rad_angle)*random_distance) + x;
//			var limit_y = (sin(rad_angle)*random_distance) + y;
//			var thickness = random(1);
//			var line_color = make_color_rgb(255,125,0)
			
//			draw_set_alpha(random(1));
//			draw_line_width_color(x,y,limit_x, limit_y, thickness, line_color, line_color);
//			draw_set_alpha(1);
//		}
//	}
//}

if (my_shoot_aim_mode == true){
	var angle_mouse = degtorad(angle_between(mouse_x, mouse_y, x, y));
	draw_line_width_color(x + cos(angle_mouse)*120, y + sin(angle_mouse)*120, x + cos(angle_mouse)*my_shoot_bullet_range, y + sin(angle_mouse)*my_shoot_bullet_range, 1, my_shoot_flair_color, my_shoot_flair_color);
}