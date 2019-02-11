var argument_array = argument0;
var did_create = true;
var should_init = true;
if (variable_instance_exists(id, "action_autoshield") && ds_exists(action_autoshield, ds_type_map)){should_init = false};

if (should_init){
	action_autoshield = ds_create("map");
	action_autoshield[?"duration"] = argument_array[0];

	action_autoshield[?"cooldown_treshold"] = argument_array[1];
	action_autoshield[?"cooldown_value"] = argument_array[2];
	action_autoshield[?"cooldown_timer"] = 0;

	action_autoshield[?"active_value"] = argument_array[3];
	action_autoshield[?"active_treshold"] = argument_array[4];
	action_autoshield[?"active_bank"] = 0;
	action_autoshield[?"active_timer"] = 0;

	action_autoshield[?"was_flinched"] = 0;

	action_autoshield[?"grit_duration"] = argument_array[5];
	action_autoshield[?"grit_cooldown_value"] = argument_array[6];
	action_autoshield[?"grit_cooldown_timer"] = argument_array[7];
} else {
	action_autoshield[?"duration"] = argument_array[0];
	action_autoshield[?"cooldown_treshold"] = argument_array[1];
	action_autoshield[?"cooldown_value"] = argument_array[2];
	action_autoshield[?"active_value"] = argument_array[3];
	action_autoshield[?"active_treshold"] = argument_array[4];
	action_autoshield[?"grit_duration"] = argument_array[5];
	action_autoshield[?"grit_cooldown_value"] = argument_array[6];
	action_autoshield[?"grit_cooldown_timer"] = argument_array[7];
}

if (should_init){
	ds_list_add(actor_actions_module, ["autoshield", [
		"step",
		"damage_take"
	]])
}

return did_create;
