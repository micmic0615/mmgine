var argument_array = argument0;

action_chase = ds_create("map");

action_chase[?"color"] = argument_array[0];

action_chase[?"distance"] = argument_array[1];
action_chase[?"movespeed_set"] = argument_array[2];
action_chase[?"movesnap_set"] = argument_array[3];

action_chase[?"success"] = false;

action_generic_create(action_chase, [
	/*free_action*/ true,
	/*cast_value*/ argument_array[4],
	/*channel_value*/ argument_array[5],
	/*backswing_value*/ argument_array[6],
	/*cooldown_value*/ argument_array[7],
	/*animation_cast*/ "rest",
	/*animation_channel*/ "chase",
	/*animation_backswing*/ "rest",
]);

ds_list_add(actor_actions_module, ["chase", [
	"step"
]])