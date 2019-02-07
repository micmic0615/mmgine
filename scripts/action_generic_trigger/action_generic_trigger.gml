var action_map_source = argument[0];
var target = argument[1];

var did_act = false;
var action_map = ds_map_create();
ds_map_copy(action_map, action_map_source);

if (
	actor_actions_enabled && 
	action_map[?"backswing_timer"] <= 0 && 
	action_map[?"cooldown_timer"] <= 0 &&
	action_map[?"sequence"] <= 1 && (
	(!action_map[?"free_action"] && actor_actions_idle) ||
	(action_map[?"free_action"])
	)
){
	did_act = true;
	if (is_array(target)){
		action_map[?"target_entity"] = noone;
		action_map[?"target_point"] = target;
		action_map[?"target_angle"] = point_direction(x,y,target[0],target[1]);
	} else {
		action_map[?"target_entity"] = target;
		action_map[?"target_point"] = [target.x,target.y];
		action_map[?"target_angle"] = point_direction(x,y,target.x,target.y);
	}
	
}

ds_map_copy(action_map_source, action_map);
ds_map_destroy(action_map);

return did_act