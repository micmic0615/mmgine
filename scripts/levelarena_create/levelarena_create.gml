arena_component_size = 800;
arena_component_list = ds_create("list");

arena_loop_index = 0;
arena_loop_max = (room_width*room_height) / sqr(arena_component_size);

var me = id;

while(arena_loop_index < arena_loop_max){
	var arena_vertical = 0;
	var arena_x = arena_loop_index*arena_component_size;
	while(arena_x >= room_width){arena_vertical++; arena_x -= room_width};
	var arena_y = arena_vertical*arena_component_size;
	
	var tiles_list = [];
	var tiles_current = 0;
	
	with(TileComponent){
		if (
			(x >= arena_x && x < arena_x + me.arena_component_size) &&
			(y >= arena_y && y < arena_y + me.arena_component_size)
		){
			tiles_list[tiles_current] = [				
				x - arena_x,
				y - arena_y,
				depth,
				object_index,
				image_xscale,
				image_yscale,
			];
			
			tiles_current ++;			
		}
	}
	
	ds_list_add(arena_component_list, tiles_list);
	arena_loop_index++
}

with(TILE){instance_destroy(id)};

var component_list_length = ds_list_size(arena_component_list);

arena_loop_index = 0;
while(arena_loop_index < arena_loop_max){
	var arena_vertical = 0;
	var arena_x = arena_loop_index*arena_component_size;
	while(arena_x >= room_width){arena_vertical++; arena_x -= room_width};
	var arena_y = arena_vertical*arena_component_size;
	
	var component_random = round(random(component_list_length))
	if (component_random >= component_list_length){component_random = component_list_length - 1};
	
	var random_spawn = ds_list_find_value(arena_component_list, component_random);
	
	for(var i = 0; i < array_length_1d(random_spawn);i++){
		var tile_object = random_spawn[i];
		
		var tile_instance = instance_create_depth(tile_object[0] + arena_x , tile_object[1] + arena_y, tile_object[2], tile_object[3]);
		tile_instance.image_xscale = tile_object[4];
		tile_instance.image_yscale = tile_object[5];
	}
	
	arena_loop_index++
}

levelproto00_create()