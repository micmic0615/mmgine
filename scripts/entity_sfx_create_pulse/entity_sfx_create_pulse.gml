var sprite = argument[0];
var duration = argument[1];
var loc_x = x;
var loc_y = y;
var blend = argument[2];
var angle = 0;
var mirage_direction = 1;
var scale = 1;
var anchor = argument_count >= 5 ? argument[4] : id;
var style = "expand";
var style_data = argument[3];


var mirage_data = [
	sprite,
	image_index,
	loc_x,
	loc_y,
	scale*mirage_direction,
	scale,
	angle,
	blend,
	0.5,
	duration,
	duration,
	anchor,
	style,
	style_data
]

		
with(ROOM){ds_list_add(draw_mirage_list, mirage_data)}