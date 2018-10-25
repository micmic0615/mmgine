var script_name = argument[0];
var script_class = asset_get_index(entity_type_lower + "_" + script_name );

if (script_class > -1){
	if (argument_count > 1){
		var args = argument[1];
		return script_execute(script_class, args)
	} else {
		return script_execute(script_class)
	}
};

