var sprite = argument0;
var duration = argument1;
var loc_x = argument2;
var loc_y = argument3;
var blend = argument4;
var angle = argument5;
var mirage_direction = argument6;
var scale = argument7;
var anchor = argument8;
var style = argument9;
var style_data = argument10;


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