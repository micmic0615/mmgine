var argument_array = argument0;

action_dash = ds_create("map");

action_dash[?"color"] = argument_array[0];

action_dash[?"speed"] = argument_array[1];
action_dash[?"range"] = argument_array[2];

action_dash[?"combo_max"] = argument_array[3];

action_dash[?"cooldown_multi_value"] = argument_array[7];
action_dash[?"cooldown_multi_timer"] = ds_create("list");
action_dash_cooldown_reset();

action_dash[?"queue_active"] = false;
action_dash[?"queue_angle"] = 0;

action_generic_create("dash", [
	/*free_action*/ false,
	/*cast_value*/ argument_array[4],
	/*channel_value*/ argument_array[5],
	/*backswing_value*/ argument_array[6],
	/*cooldown_value*/ 0,
	/*animation_cast*/ "rise",
	/*animation_channel*/ "dash",
	/*animation_backswing*/ "dash",
]);

ds_list_add(actor_actions_module, ["dash", [
	"step"
]])