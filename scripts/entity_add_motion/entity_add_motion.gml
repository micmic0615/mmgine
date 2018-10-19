var motion_x = argument0;
var motion_y = argument1;
var motion_lifespan = argument2;
var motion_decay = (argument_count >= 4) ? argument[3] : undefined;
var motion_id = (argument_count == 5) ? argument[4] : undefined; 

var motion_push = [
	motion_x,
	motion_y,
	motion_lifespan,
	motion_decay,
	motion_id
];

ds_list_add(physics_motion_list, motion_push)