for (var i = 0; i < ds_list_size(draw_mirage_list); ++i) {
	var p = ds_list_find_value(draw_mirage_list, i);
		
	var sprite_val = p[0]; 
	var image_val = p[1];
	var loc_x = p[2]; 
	var loc_y = p[3]; 
	var scale_x = p[4]; 
	var scale_y = p[5]; 
	var sprite_angle = p[6]; 
	var color = p[7]; 
	var base_alpha = p[8];
	var duration = p[9]; 
	var total_duration = p[10];
	var anchor_entity = p[11];
	var style = "static";
	var style_data = [];
	if (array_length_1d(p) >= 13){
		style = p[12];
		style_data = p[13];
	}
		
	if (anchor_entity != noone && instance_exists(anchor_entity)){
		p[2] = anchor_entity.x;
		p[3] = anchor_entity.y;
	}
		
	switch(style){
		case "expand":
			var explosion_life_ratio = sqr(duration/total_duration)
			var explosion_size = style_data[0] + ((1 - explosion_life_ratio) * (style_data[1] - style_data[0]));
	
			p[4] = (explosion_size*2)/sprite_get_width(sprite_val);
			p[5] = (explosion_size*2)/sprite_get_height(sprite_val);
				
	
			p[8] = duration/total_duration;
				
			if (array_length_1d(style_data) == 3){
				base_alpha = style_data[2];
			}
			break
			
			
		case "static":
		default: break
	}
	
	if (duration > 0){
		var alpha = base_alpha*(duration/total_duration); 
		p[9] -= TIMESPEED;
		draw_sprite_ext(p[0], p[1], p[2], p[3], p[4], p[5], p[6], color, alpha);
		
		ds_list_replace(draw_mirage_list, i, p);
	} else {
		ds_list_delete(draw_mirage_list, i)
	}
}