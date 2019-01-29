var p_color = argument[0];
var p_size = argument[1];
var p_speed = argument[2];
var p_duration = argument[3];
var p_type = argument_count >= 5 ? argument[4] : pt_shape_disk;

var particle1 = part_type_create();

part_type_shape(particle1, p_type);
part_type_size(particle1,0.05*p_size,0.01*p_size,0,0.01*p_size);
part_type_scale(particle1,1,1);
part_type_color1(particle1,p_color);
part_type_alpha2(particle1,0.7,0);
part_type_speed(particle1,3*p_speed,0,-0.05,0.10*p_speed);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0.02,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,p_duration,p_duration);


return particle1;