if (my_time_stop_channel){
	var me = id;
	with(BULLET){
		if (bullet_origin == me){
			bullet_seek_target = noone;
			var rad_angle = degtorad(bullet_action_move_angle)
			
			var random_distance = me.my_attack_bullet_range + random(me.my_attack_bullet_range)
			
			var limit_x = (cos(rad_angle)*random_distance) + x;
			var limit_y = (sin(rad_angle)*random_distance) + y;
			var thickness = random(1);
			var line_color = make_color_rgb(255,125,0)
			
			draw_set_alpha(random(1));
			draw_line_width_color(x,y,limit_x, limit_y, thickness, line_color, line_color);
			draw_set_alpha(1);
		}
	}
}