if (mouse_check_button(global.mouse_1)){
	actor_omnimove_point(mouse_x, mouse_y)
}

ROOM.camera_target_x = x;
ROOM.camera_target_y = y;