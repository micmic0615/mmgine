var argument_array = argument0;

action_strike = ds_create("map");

action_strike[?"color"] = argument_array[0];

action_strike[?"speed"] = argument_array[1];
action_strike[?"range"] = argument_array[2];

action_strike[?"radius"] = argument_array[3];
action_strike[?"damage"] = argument_array[4];
action_strike[?"flinch"] = argument_array[5];
action_strike[?"push"] = argument_array[6];

action_strike[?"combo_count"] = 0;
action_strike[?"combo_timer"] = 0;

action_generic_create(action_strike, [
	/*free_action*/ false,
	/*cast_value*/ argument_array[7],
	/*channel_value*/ argument_array[8],
	/*backswing_value*/ argument_array[9],
	/*cooldown_value*/ argument_array[10],
	/*animation_cast*/ "rise",
	/*animation_channel*/ "dash",
	/*animation_backswing*/ "rest",
]);

ds_list_add(actor_actions_module, ["strike", [
	"step"
]])