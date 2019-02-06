var target_point = action_strike[?"target_point"];
entity_run_type_scripts("action_strike", target_point);

var strike_angle = angle_between(target_point[0], target_point[1], x,y);
entity_motion_push(action_strike[?"range"], action_strike[?"range"]/action_strike[?"speed"], strike_angle, ["multiply",1.25], "move_motion");