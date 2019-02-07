var action_map_source = argument0;
var argument_array = argument1;

var action_map = ds_map_create();
ds_map_copy(action_map, action_map_source);

action_map[?"free_action"] = argument_array[0];

action_map[?"cast_value"] = argument_array[1];
action_map[?"cast_timer"] = 0;

action_map[?"channel_value"] = argument_array[2];
action_map[?"channel_timer"] = 0;

action_map[?"backswing_value"] = argument_array[3];
action_map[?"backswing_timer"] = 0;

action_map[?"cooldown_value"] = argument_array[4];
action_map[?"cooldown_timer"] = 0;

action_map[?"sequence"] = 0;

action_map[?"animation_cast"] = argument_array[5];
action_map[?"animation_channel"] = argument_array[6];
action_map[?"animation_backswing"] = argument_array[7];

action_map[?"target_entity"] = noone;
action_map[?"target_point"] = [0,0];
action_map[?"target_angle"] = 0;

ds_map_copy(action_map_source, action_map);
ds_map_destroy(action_map);