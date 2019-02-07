var action_map = argument[0];

var cast_value = 1 - (action_map[?"cast_timer"] / action_map[?"cast_value"]);
var p_spawn = 60;
var p_count = 5;
var p_model = game_particle_setup_basic(my_chase_color, (1 + random(2)*cast_value), 1 + 1.5*cast_value, 0.5*SEC);

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_spark,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);