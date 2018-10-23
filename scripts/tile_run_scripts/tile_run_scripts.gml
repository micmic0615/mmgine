var script_name = argument0;

var script_type = asset_get_index(tile_type_lower + "_" +  script_name );
if (script_type > -1){script_execute(script_type)};