var action_map = argument[0];
var target_point = action_map[?"target_point"];
entity_run_type_scripts("action_strike_cast_point", target_point);

var strike_angle = angle_between(target_point[0], target_point[1], x,y);
entity_motion_push(action_map[?"range"], action_map[?"range"]/action_map[?"speed"], strike_angle, ["multiply",1.25], "move_motion");