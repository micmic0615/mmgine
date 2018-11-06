var duration = argument[0];
var offset_x = argument_count >= 2 ? argument[1] : 0;
var offset_y = argument_count >= 3 ? argument[2] : 0;
var blend = argument_count >= 4 ? argument[3] : image_blend;
var angle = argument_count >= 5 ? argument[4] : animation_angle;
var mirage_direction = argument_count >= 6 ? argument[5] : animation_direction;
var sprite = argument_count >= 7 ? argument[6] : sprite_index;

var mirage_data = [
	sprite,
	image_index,
	x + offset_x,
	y + offset_y,
	image_xscale*mirage_direction,
	image_yscale,
	angle,
	blend,
	0.5,
	duration,
	duration
]
		
with(ROOM){ds_list_add(draw_mirage_list, mirage_data)}