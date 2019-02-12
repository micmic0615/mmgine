var script_name = argument0;

if (global.room_class != undefined){
	var script_class = asset_get_index(string_lower(global.room_class) + "_" + script_name );
	if (script_class > -1){script_execute(script_class)};
} 

if (global.room_type != undefined){
	var script_class = asset_get_index(string_lower(global.room_type) + "_" + script_name );
	if (script_class > -1){script_execute(script_class)};
} 

var script_class = asset_get_index(room_name_lower + "_" + script_name );
if (script_class > -1){script_execute(script_class)};