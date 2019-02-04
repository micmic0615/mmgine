if (my_chase_jump_cast_timer > 0){
	draw_set_alpha(random((0.25 + 0.5)))
	var fire_angle = degtorad(angle_between(my_chase_jump_point[0],my_chase_jump_point[1],x,y));
	var distance = my_chase_jump_range*0.75 + random(my_chase_jump_range*0.75)
	var angle_x = cos(fire_angle)*distance;
	var angle_y = sin(fire_angle)*distance;
	draw_line_width_color(x,y,x + angle_x,y + angle_y, 1 + random(2), my_chase_color,my_chase_color_particles)
	draw_set_alpha(1)
}