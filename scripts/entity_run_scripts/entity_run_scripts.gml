var script_name = argument0;

var script_class = asset_get_index(string_lower(entity_class) + "_" + script_name );
if (script_class > -1){script_execute(script_class)};

var script_type = asset_get_index(string_lower(entity_type) + "_" +  script_name );
if (script_type > -1){script_execute(script_type)};