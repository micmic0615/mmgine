var action_map = argument[0];
action_chase[?"success"] = false;

var target_point = action_map[?"target_point"];
var back_angle = angle_between(x,y,target_point[0],target_point[1]);
entity_motion_push(240, my_strike_cast_value, back_angle, ["multiply",1.1]);