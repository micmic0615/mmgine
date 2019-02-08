var argument_array = argument0;
var did_create = true;
var should_init = true;
if (variable_instance_exists(id, "action_shoot") && ds_exists(action_shoot, ds_type_map)){should_init = false};

if (should_init){
	action_shoot = ds_create("map");
	action_generic_fire_bullet_create(action_shoot, argument_array);
	action_shoot[?"combo_max"] = argument_array[23];

	action_shoot[?"combo_count"] = 0;
	action_shoot[?"combo_timer"] = 0;
	
	action_shoot[?"create_lock"] = 0;
	
	action_generic_create(action_shoot, [
		/*free_action*/ false,
		/*cast_value*/ argument_array[24],
		/*channel_value*/ argument_array[25],
		/*backswing_value*/ argument_array[26],
		/*cooldown_value*/ argument_array[27],
		/*animation_cast*/ "channel",
		/*animation_channel*/ "attack",
		/*animation_backswing*/ "rest",
	]);
} else {
	if(action_shoot[?"create_lock"] <= 0){
		action_generic_fire_bullet_create(action_shoot, argument_array);
		action_shoot[?"combo_max"] = argument_array[23];
		action_shoot[?"cast_value"] = argument_array[24];
		action_shoot[?"channel_value"] = argument_array[25];
		action_shoot[?"backswing_value"] = argument_array[26];
		action_shoot[?"cooldown_value"] = argument_array[27];
	} else {
		did_create = false
	}
}

if (should_init){
	ds_list_add(actor_actions_module, ["shoot", [
		"step"
	]])
}

return did_create;