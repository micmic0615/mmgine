var text_value = argument[0];
var text_offset = argument[1];
var text_lifespan = argument[2];
var text_color = argument[3];
var text_size = argument[4];

ds_list_add(ROOM.draw_text_list, [	
	text_value,
	text_offset, 
	text_lifespan,
	text_color, 
	text_size,
	text_lifespan,
	[id],
]);