#define scr_particle
//background-alpha: 0.10
//Below is particle code:
Sname = part_system_create();


particle1 = part_type_create();
part_type_shape(particle1,pt_shape_spark);
part_type_size(particle1,0.19,0.29,-0.07,1);
part_type_scale(particle1,2.96,1.44);
part_type_color3(particle1,4601880,3111260,8876728);
part_type_alpha3(particle1,0.99,0.61,0.06);
part_type_speed(particle1,2.55,4.97,0.08,4);
part_type_direction(particle1,102,193,-1,8);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,23,270,0.40,6,0);
part_type_blend(particle1,1);
part_type_life(particle1,46,76);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_stream(Sname,emitter1,particle1,5);