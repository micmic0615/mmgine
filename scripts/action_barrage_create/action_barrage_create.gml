var argument_array = argument0;

action_barrage = ds_create("map");

action_barrage[?"color"] = argument_array[0];

action_barrage[?"bullet_type"] = argument_array[1];
action_barrage[?"bullet_speed"] = argument_array[2];
action_barrage[?"bullet_range"] = argument_array[3];
action_barrage[?"bullet_radius"] = argument_array[4];
action_barrage[?"bullet_interval"] = argument_array[5];
action_barrage[?"bullet_particles"] = argument_array[6];
action_barrage[?"bullet_impact_health"]  = argument_array[7];
action_barrage[?"bullet_explosion_radius"]  = argument_array[8];

action_barrage[?"damage"] = argument_array[9];
action_barrage[?"flinch"] = argument_array[10];
action_barrage[?"push"] = argument_array[11];

action_barrage[?"turn_rate_cast"] = argument_array[12];
action_barrage[?"turn_rate_channel"] = argument_array[13];

action_barrage[?"recoil"] = argument_array[14];

action_barrage[?"bullet_angle_chaos"] = argument_array[15];
action_barrage[?"bullet_seek_range"] = argument_array[16];
action_barrage[?"bullet_seek_turn_rate"] = argument_array[17];
action_barrage[?"bullet_seek_angle_limit"] = argument_array[18];


action_barrage[?"active_angle"] = 0;

action_generic_create(action_barrage, [
	/*free_action*/ false,
	/*cast_value*/ argument_array[19],
	/*channel_value*/ argument_array[20],
	/*backswing_value*/ argument_array[21],
	/*cooldown_value*/ argument_array[22],
	/*animation_cast*/ "channel",
	/*animation_channel*/ "attack",
	/*animation_backswing*/ "rest",
]);

ds_list_add(actor_actions_module, ["barrage", [
	"step"
]])