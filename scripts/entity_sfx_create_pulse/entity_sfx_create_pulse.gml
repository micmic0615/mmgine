var sprite = argument0;
var duration = argument1;
var loc_x = 0;
var loc_y = 0;
var blend = argument2;
var angle = 0;
var mirage_direction = 1;
var scale = 1;
var anchor = id;
var style = "expand";
var style_data = argument3;


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