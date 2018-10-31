if (ACTIVE){
	#region //CLONES
		if (tile_original){
			if (tile_initiate == true){				
				#region //CREATE CLONES
					if (ROOM.room_loop_x){
						if (x > room_width/2){
							ds_list_add(tile_clones, instance_create_depth(x - room_width, y,depth,object_index));
						} else {
							ds_list_add(tile_clones, instance_create_depth(x + room_width, y,depth,object_index));
						}
					}
		
					if (ROOM.room_loop_y){
						if (y > room_height/2){
							ds_list_add(tile_clones, instance_create_depth(x, y - room_height,depth,object_index));
						} else {
							ds_list_add(tile_clones, instance_create_depth(x, y + room_height,depth,object_index));
						}
					}
		
					if (ROOM.room_loop_x && ROOM.room_loop_y){
						if (x > room_width/2){
							if (y > room_height/2){
								ds_list_add(tile_clones, instance_create_depth(x - room_width, y - room_height,depth,object_index));
							} else {
								ds_list_add(tile_clones, instance_create_depth(x - room_width, y + room_height,depth,object_index));
							}
						} else {
							if (y > room_height/2){
								ds_list_add(tile_clones, instance_create_depth(x + room_width, y - room_height,depth,object_index));
							} else {
								ds_list_add(tile_clones, instance_create_depth(x + room_width, y + room_height,depth,object_index));
							}
						}
					}
	
					tile_initiate = false
				#endregion
			} else {				
				#region //MOVE CLONES
					for(var i = 0; i < ds_list_size(tile_clones);i++){
						var p = ds_list_find_value(tile_clones, i);
						p.image_xscale = image_xscale;
						p.image_yscale = image_yscale;
						p.image_angle = image_angle;
					}
				#endregion
			}
		}
	#endregion
	
	#region //CAMERA
		var camera_view_x = camera_get_view_x(view_camera[0]);
		var camera_view_y = camera_get_view_y(view_camera[0]);
		var camera_size_w = camera_get_view_width(view_camera[0]);
		var camera_size_h = camera_get_view_height(view_camera[0]);

		var camera_padding_x = sprite_width/2;
		var camera_padding_y = sprite_height/2;
		
		var inside_x = (x > camera_view_x - camera_padding_x && x < camera_view_x + camera_size_w + camera_padding_x);
		var inside_y = (y > camera_view_y - camera_padding_y && y < camera_view_y + camera_size_h + camera_padding_y);

		camera_inside_view = (inside_x && inside_y) ? true : false;
	#endregion

	tile_run_scripts("step");
} else {
	ROOM = instance_find(ROOM_OBJECT, 0);
	ACTIVE = true;
}