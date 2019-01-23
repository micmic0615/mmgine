#define scr_particle
//Below is particle code:
Sname = part_system_create();


particle1 = part_type_create();
part_type_shape(particle1,pt_shape_sphere);
part_type_size(particle1,0.10,0.30,0,0);
part_type_scale(particle1,1,1);
part_type_color1(particle1,191);
part_type_alpha2(particle1,1,0);
part_type_speed(particle1,1,5,0,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0.40,270);
part_type_orientation(particle1,0,0,0,0,0);
part_type_blend(particle1,0);
part_type_life(particle1,20,20);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_stream(Sname,emitter1,particle1,5);