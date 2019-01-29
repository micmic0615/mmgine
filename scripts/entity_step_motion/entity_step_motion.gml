var motion_angle = entity_step_motion_angle();

var move_total_x = motion_angle[0];
var move_total_y =  motion_angle[1];

var gravity_x = motion_angle[2];
var gravity_y = motion_angle[3];

var motion_list = entity_step_motion_list(move_total_x, move_total_y);

move_total_x = motion_list[0];
move_total_y = motion_list[1];

var movement_x = motion_list[2];
var movement_y = motion_list[3];
		
entity_step_motion_gravity(move_total_x, move_total_y, gravity_x, gravity_y, movement_x, movement_y);

return [movement_x, movement_y]