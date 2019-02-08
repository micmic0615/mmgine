var argument_array = argument0;

action_barrage = ds_create("map");

action_generic_fire_bullet_create(action_barrage, argument_array);

action_barrage[?"turn_rate_cast"] = argument_array[23];
action_barrage[?"turn_rate_channel"] = argument_array[24];

action_barrage[?"interval"] = argument_array[25];
action_barrage[?"active_angle"] = 0;

action_generic_create("barrage", [
	/*free_action*/ false,
	/*cast_value*/ argument_array[26],
	/*channel_value*/ argument_array[27],
	/*backswing_value*/ argument_array[28],
	/*cooldown_value*/ argument_array[29],
	/*animation_cast*/ "channel",
	/*animation_channel*/ "attack",
	/*animation_backswing*/ "rest",
]);

ds_list_add(actor_actions_module, ["barrage", [
	"step"
]])