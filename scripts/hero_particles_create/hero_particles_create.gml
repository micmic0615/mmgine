var p_spawn = argument0;
var p_model = argument1;
var p_count = argument2;

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),ps_shape_ellipse,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);