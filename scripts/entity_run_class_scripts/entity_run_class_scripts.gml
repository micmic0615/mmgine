var script_name = argument0;

var script_class = asset_get_index(entity_class_lower + "_" + script_name );
if (script_class > -1){script_execute(script_class)};