var target_point = action_dash[?"target_point"];
entity_run_type_scripts("action_dash", target_point);

var dash_angle = angle_between(x,y, target_point[0], target_point[1]);
entity_motion_push(action_dash[?"range"], action_dash[?"range"]/action_dash[?"speed"], dash_angle  -180, ["multiply",1.25], "move_motion");

for(var i = 0; i < ds_list_size(action_dash[?"cooldown_multi_timer"]);i++){
	var p = ds_list_find_value(action_dash[?"cooldown_multi_timer"], i);
	if (p <= 0){
		ds_list_replace(action_dash[?"cooldown_multi_timer"], i,  action_dash[?"cooldown_multi_value"])
		break
	};		
};