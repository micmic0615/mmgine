var script_name = argument0;

var script_class = asset_get_index(string_lower(room_get_name(room)) + "_" + script_name );
if (script_class > -1){script_execute(script_class)};