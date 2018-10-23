if (mouse_check_button(mb_right)){
	var angle = radtodeg(arctan2((mouse_y - y), (mouse_x - x)));
	var move_speed = 600*PPS/5;
	image_angle = point_direction(mouse_x, mouse_y, x, y);

	var move_x = cos(degtorad(angle))*move_speed;
	var move_y = sin(degtorad(angle))*move_speed;
	entity_add_motion(move_x, move_y, 5);
}

ROOM.camera_target_x = x;
ROOM.camera_target_y = y;