var p_spawn = 120;
var p_count = 10;
var p_model = game_particle_setup_basic(my_chase_color_particles, (1 + random(2)), 2, 1.5*SEC);

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			
my_chase_jump_count = my_chase_jump_max;
my_chase_jump_mirage_timer = 0;
my_chase_jump_cast_timer = 0;
my_chase_jump_active = false;
my_chase_jump_mirage_down = false;
my_chase_jump_cooldown_timer = my_chase_jump_cooldown_value/2;