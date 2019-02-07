var action_map = argument[0];
physics_gravity_current = 0;

var target_point = action_map[?"target_point"];
var target_angle = angle_between(target_point[0], target_point[1], x,y);
action_map[?"active_angle"] =  angle_shift(action_map[?"active_angle"], target_angle, action_map[?"sequence"] == 1 ? action_map[?"turn_rate_cast"] : action_map[?"turn_rate_channel"]);

var rad_angle = degtorad(action_map[?"active_angle"]);
entity_face_point([
	x + cos(rad_angle)*INFINITY,
	y + sin(rad_angle)*INFINITY,
]);