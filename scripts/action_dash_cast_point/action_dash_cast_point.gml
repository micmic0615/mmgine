var action_map = argument[0];
entity_run_type_scripts("action_dash_cast_point", action_map);

var target_point = action_map[?"target_point"];
var dash_angle = angle_between(x,y, target_point[0], target_point[1]);
entity_motion_push(action_map[?"range"], action_map[?"range"]/action_map[?"speed"], dash_angle  -180, ["multiply",1.25], "move_motion");

physics_gravity_current = 0;
if (action_map[?"iframe_duration"] >= 1){
	actor_buff_apply("iframe", action_map[?"iframe_duration"], [], "dash_iframe");
}


for(var i = 0; i < ds_list_size(action_map[?"cooldown_multi_timer"]);i++){
	var p = ds_list_find_value(action_map[?"cooldown_multi_timer"], i);
	if (p <= 0){
		ds_list_replace(action_map[?"cooldown_multi_timer"], i,  action_map[?"cooldown_multi_value"])
		break
	};		
};