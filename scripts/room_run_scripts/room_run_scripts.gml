var script_name = argument0;

var room_parent = global.parent_room;
var room_parent_name = room_get_name(room_parent);

if (room_parent > -1 && room_parent_name != "GameStart"){
	var script_class = asset_get_index(string_lower(room_parent_name) + "_" + script_name );
	if (script_class > -1){script_execute(script_class)};
} 

var script_class = asset_get_index(room_name_lower + "_" + script_name );
if (script_class > -1){script_execute(script_class)};