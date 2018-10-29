var duration = argument[0];
var offset_x = argument_count >= 2 ? argument[1] : 0;
var offset_y = argument_count >= 3 ? argument[2] : 0;
var blend = argument_count >= 4 ? argument[3] : image_blend;
var mirage_data = [
	sprite_index,
	image_index,
	x + offset_x,
	y + offset_y,
	image_yscale*animation_direction,
	image_yscale,
	animation_angle,
	blend,
	0.5,
	duration,
	duration
]
		
with(ROOM){ds_list_add(draw_mirage_list, mirage_data)}