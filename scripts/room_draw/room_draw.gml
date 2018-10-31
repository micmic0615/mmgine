#region //DRAW ENTITY MIRAGE
	for (var i = 0; i < ds_list_size(draw_mirage_list); ++i) {
		var p = ds_list_find_value(draw_mirage_list, i);
	
		var duration = p[9]; 
	
		if (duration > 0){
		
			
			var sprite_val = p[0]; 
			var image_val = p[1];
			var loc_x = p[2]; 
			var loc_y = p[3]; 
			var scale_x = p[4]; 
			var scale_y = p[5]; 
			var sprite_angle = p[6]; 
			var color = p[7]; 
			var alpha = p[8]*(p[9]/p[10]); 
		
			p[9] -= 1;
	
			draw_sprite_ext(p[0], p[1], p[2], p[3], p[4], p[5], p[6], color, alpha);
			
		
			ds_list_replace(draw_mirage_list, i, p);
		} else {
			ds_list_delete(draw_mirage_list, i)
		}
	}
#endregion

room_run_scripts("draw");