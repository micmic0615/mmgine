#define scr_particle
//Below is particle code:
Sname = part_system_create();


particle1 = part_type_create();
part_type_shape(particle1,pt_shape_sphere);
part_type_size(particle1,1,1,0,0);
part_type_scale(particle1,1,1);
part_type_color2(particle1,16777153,16777039);
part_type_alpha2(particle1,1,0.30);
part_type_speed(particle1,3,3,0,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,60);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_stream(Sname,emitter1,particle1,5);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_disk);
part_type_size(particle2,0.10,0.48,0,0);
part_type_scale(particle2,1,1.02);
part_type_color3(particle2,6971466,3016492,10838043);
part_type_alpha3(particle2,0.98,0.49,0.10);
part_type_speed(particle2,1.15,2.44,0.04,0);
part_type_direction(particle2,0,359,-1,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,0,0,0,1);
part_type_blend(particle2,1);
part_type_life(particle2,25,40);

part_type_step(particle1,-2,particle2);
