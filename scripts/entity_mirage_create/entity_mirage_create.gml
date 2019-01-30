var duration = argument[0];
var offset_x = argument_count >= 2 ? argument[1] : 0;
var offset_y = argument_count >= 3 ? argument[2] : 0;
var blend = argument_count >= 4 ? argument[3] : image_blend;
var alpha = argument_count >= 5 ? argument[4] : 0.5;
var angle = argument_count >= 6 ? argument[5] : animation_angle;
var mirage_direction = argument_count >= 7 ? argument[6] : animation_direction;
var sprite = argument_count >= 8 ? argument[7] : sprite_index;
var sprite_frame = argument_count >= 9 ? argument[8] : image_index;

var mirage_data = [
	sprite,
	sprite_frame,
	x + offset_x,
	y + offset_y,
	image_xscale*mirage_direction,
	image_yscale,
	angle,
	blend,
	alpha,
	duration,
	duration,
	noone
]
		
with(ROOM){ds_list_add(draw_mirage_list, mirage_data)}