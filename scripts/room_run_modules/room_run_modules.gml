var module_action_name = argument[0];
var module_arguments = argument_count >= 2 ? argument[1] : undefined;

var return_arguments = undefined;

if (ds_exists(room_module_list, ds_type_list)){
	for(var i = 0; i < ds_list_size(room_module_list);i++){
		var p = ds_list_find_value(room_module_list, i);
		var module_name = p[0];
		var module_actions = p[1];
	
		for(var i2 = 0; i2 < array_length_1d(module_actions);i2++){
			var p2 = module_actions[i2];
			if (p2 == module_action_name){
				var action_script = asset_get_index("module_" + module_name + "_" + module_action_name);
				if (action_script > 0){
					return_arguments = script_execute(action_script, module_arguments)
				}
			}
		}
	}
}


return return_arguments;