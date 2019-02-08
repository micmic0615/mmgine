var argument_array = argument0;
var did_create = true;
var should_init = true;
if (variable_instance_exists(id, "action_invoke") && ds_exists(action_invoke, ds_type_map)){should_init = false};

if (should_init){
	action_invoke = ds_create("map");
	
	action_invoke[?"create_lock"] = 0;
	
	action_generic_create(action_invoke, [
		/*free_action*/ false,
		/*cast_value*/ argument_array[0],
		/*channel_value*/ argument_array[1],
		/*backswing_value*/ argument_array[2],
		/*cooldown_value*/ argument_array[3],
		/*animation_cast*/ argument_array[4],
		/*animation_channel*/ argument_array[5],
		/*animation_backswing*/ argument_array[6],
	]);
} else {
	if(action_invoke[?"create_lock"] <= 0){
		action_generic_fire_bullet_create(action_invoke, argument_array);
		action_invoke[?"cast_value"] = argument_array[0];
		action_invoke[?"channel_value"] = argument_array[1];
		action_invoke[?"backswing_value"] = argument_array[2];
		action_invoke[?"cooldown_value"] = argument_array[3];
		action_invoke[?"animation_cast"] = argument_array[4];
		action_invoke[?"animation_channel"] = argument_array[5];
		action_invoke[?"animation_backswing"] = argument_array[6];
	} else {
		did_create = false
	}
}

if (should_init){
	ds_list_add(actor_actions_module, ["invoke", [
		"step"
	]])
}

return did_create;