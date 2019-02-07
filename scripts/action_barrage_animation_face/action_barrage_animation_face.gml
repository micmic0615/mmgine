var action_map = argument[0];
physics_gravity_current = 0;

var target_point = action_map[?"target_point"];
var target_angle = angle_between(target_point[0], target_point[1], x,y);
action_map[?"active_angle"] =  angle_shift(action_map[?"active_angle"], target_angle, action_map[?"sequence"] == 1 ? action_map[?"turn_rate_cast"] : action_map[?"turn_rate_channel"]);

var rad_angle = degtorad(action_map[?"active_angle"]);
var facing_point = [
	x + cos(rad_angle)*10,
	y + sin(rad_angle)*10,
];
		
var shoot_angle = point_direction(x,y,facing_point[0],facing_point[1]);
var compute_flip = (shoot_angle <= 90 && shoot_angle >= 0) || (shoot_angle <= 360 && shoot_angle >= 270)
var action_angle = compute_flip ? shoot_angle : shoot_angle - 180;
var action_direction = compute_flip ? 1 : -1;
		
animation_angle = action_angle;
animation_direction = action_direction;