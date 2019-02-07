var action_map = argument[0];
var target_point = action_map[?"target_point"];
entity_run_type_scripts("action_strike_cast_active", target_point);

var target_angle = point_direction(x,y,target_point[0],target_point[1]);

var compute_flip = (target_angle <= 90 && target_angle >= 0) || (target_angle <= 360 && target_angle >= 270)
var action_angle = compute_flip ? target_angle : target_angle - 180;
var action_direction = compute_flip ? 1 : -1;

action_map[?"target_angle"] = target_angle;

animation_angle = action_angle;
animation_direction = action_direction;

