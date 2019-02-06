var action_map_source = argument[0];
var target_point = argument[1];

var did_act = false;
var action_map = ds_map_create();
ds_map_copy(action_map, action_map_source);

if (
	actor_actions_enabled && 
	actor_actions_idle &&
	action_map[?"backswing_timer"] <= 0 && 
	action_map[?"cooldown_timer"] <= 0 &&
	action_map[?"sequence"] <= 1
){
	did_act = true;
	action_map[?"target_point"] = target_point;
	action_map[?"target_angle"] = point_direction(x,y,target_point[0],target_point[1]);
}

ds_map_copy(action_map_source, action_map);
ds_map_destroy(action_map);

return did_act