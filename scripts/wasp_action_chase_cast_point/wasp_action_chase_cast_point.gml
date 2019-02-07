var action_map = argument[0];

var p_spawn = 120;
var p_count = 10;
var p_model = game_particle_setup_basic(make_color_rgb(255,255,0), (1 + random(2)), 2, 1.5*SEC);

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			