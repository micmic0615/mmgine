for (var i = 0; i < ds_list_size(draw_text_list); ++i) {
	var p = ds_list_find_value(draw_text_list, i);
	
	var text_value = p[0];
	var text_offset = p[1];
	var text_lifespan = p[2];
	var text_size = p[4];
	var text_color = p[3];
	var text_lifespan_base = p[5];
	var text_entity = [];
		
	
	var alpha = (text_lifespan/text_lifespan_base);
		
	var text_x = text_offset[0];
	var text_y = text_offset[1];
		
	if (array_length_1d(p) >= 7){
		text_entity = p[6];
		if (instance_exists(text_entity[0])){
			text_x += text_entity[0].x;
			text_y += text_entity[0].y;
				
			p[6] = [
				text_entity[0],
				text_entity[0].x,
				text_entity[0].y
			]
		} else if (array_length_1d(text_entity) == 3){
			text_x += text_entity[1];
			text_y += text_entity[2];
		}
	}
		
	draw_set_font(fontArial)
	draw_text_transformed_colour(
		text_x, 
		text_y, 
		string(text_value),
		text_size/12,
		text_size/12,
		0,
		text_color,
		text_color,
		text_color,
		text_color,
		alpha
	);
	
		
	if(p[2] > 0){
		p[2] -= 1;
		p[1] = [
			(text_offset[0] * (1 + sqr(alpha)*0.05)),
			(text_offset[1] * (1 + sqr(alpha)*0.05))
		]
	}; 
		
	ds_list_replace(draw_text_list, i, p);
}
	
for (var i = 0; i < ds_list_size(draw_text_list); ++i) {
	var p = ds_list_find_value(draw_text_list, i);
	if(p[2] == 0){
		ds_list_delete(draw_text_list, i);
		i--;
	}
}