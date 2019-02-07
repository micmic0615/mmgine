var action_map_source = argument[0];

var action_map = ds_map_create();
ds_map_copy(action_map, action_map_source);

if (action_map[?"target_entity"] != noone && entity_enabled(action_map[?"target_entity"])){
	action_map[?"target_point"] = [
		action_map[?"target_entity"].x,
		action_map[?"target_entity"].y
	]
} else {
	action_map[?"target_entity"] = noone;
}

ds_map_copy(action_map_source, action_map);
ds_map_destroy(action_map);