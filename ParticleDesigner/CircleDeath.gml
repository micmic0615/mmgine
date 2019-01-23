#define scr_particle
//background-alpha: 0.20
//Below is particle code:
Sname = part_system_create();


particle1 = part_type_create();
part_type_shape(particle1,pt_shape_circle);
part_type_size(particle1,0.10,0.33,0,0);
part_type_scale(particle1,2.29,2.67);
part_type_color3(particle1,15061023,6439294,12642194);
part_type_alpha3(particle1,0.69,0.58,0.06);
part_type_speed(particle1,1.40,3.47,0.08,0);
part_type_direction(particle1,0,359,-1,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,0);
part_type_blend(particle1,1);
part_type_life(particle1,30,40);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_stream(Sname,emitter1,particle1,5);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_line);
part_type_size(particle2,0.20,0.30,0,0);
part_type_scale(particle2,1,2.93);
part_type_color3(particle2,1789466,2230060,6495361);
part_type_alpha3(particle2,0.80,0.49,0.04);
part_type_speed(particle2,1.84,2.26,0.12,0);
part_type_direction(particle2,0,359,1,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,0,0,0,1);
part_type_blend(particle2,1);
part_type_life(particle2,36,69);

part_type_death(particle1,1,particle2);
