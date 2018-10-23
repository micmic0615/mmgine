if (ACTIVE){
	if (tile_original){
		if (tile_initiate == true){
			if (ROOM.room_loop_x){
				if (x > room_width/2){
					ds_list_add(tile_clones, instance_create_layer(x - room_width, y,layer,object_index));
				} else {
					ds_list_add(tile_clones, instance_create_layer(x + room_width, y,layer,object_index));
				}
			}
		
			if (ROOM.room_loop_y){
				if (y > room_height/2){
					ds_list_add(tile_clones, instance_create_layer(x, y - room_height,layer,object_index));
				} else {
					ds_list_add(tile_clones, instance_create_layer(x, y + room_height,layer,object_index));
				}
			}
		
			if (ROOM.room_loop_x && ROOM.room_loop_y){
				if (x > room_width/2){
					if (y > room_height/2){
						ds_list_add(tile_clones, instance_create_layer(x - room_width, y - room_height,layer,object_index));
					} else {
						ds_list_add(tile_clones, instance_create_layer(x - room_width, y + room_height,layer,object_index));
					}
				} else {
					if (y > room_height/2){
						ds_list_add(tile_clones, instance_create_layer(x + room_width, y - room_height,layer,object_index));
					} else {
						ds_list_add(tile_clones, instance_create_layer(x + room_width, y + room_height,layer,object_index));
					}
				}
			}
	
			tile_initiate = false
		} else {
			for(var i = 0; i < ds_list_size(tile_clones);i++){
				var p = ds_list_find_value(tile_clones, i);
				p.image_xscale = image_xscale;
				p.image_yscale = image_yscale;
				p.image_angle = image_angle;
			}
		}
	}

	tile_run_scripts("step");
} else {
	ROOM = instance_find(ROOM_OBJECT, 0);
	ACTIVE = true;
}