var level_current = argument0;
var level_name = room_get_name(level_current);

var return_details = [undefined,undefined];

var current_key = ds_map_find_first(global.room_heirarchy);
while(current_key != undefined){		
	var room_one_map = ds_map_find_value(global.room_heirarchy, current_key);
	var room_one_key = ds_map_find_first(room_one_map);
	
	
	if (level_name == room_one_key){
		return_details[0]  = string_delete(current_key, 1, 4);
		
		while(room_one_key != undefined){
			return_details[1] = ds_map_find_value(room_one_map, room_one_key);
			room_one_key = ds_map_find_next(room_one_map, room_one_key);
		}
	};
		
	current_key = ds_map_find_next(global.room_heirarchy, current_key)
}

return return_details;