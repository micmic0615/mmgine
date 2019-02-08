var action_map = argument[0];
var back_interval = 0.1*SEC;
if(entity_room_age_modulo(back_interval)){
	var target_point = action_map[?"target_point"];
	var back_angle = angle_between(x,y,target_point[0],target_point[1]);
	entity_motion_push(40, back_interval*2, back_angle);
}