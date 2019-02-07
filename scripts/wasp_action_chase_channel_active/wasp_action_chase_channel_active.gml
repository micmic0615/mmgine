var action_map = argument[0];

var p_spawn = 90;
var p_count = 3;
var p_model = game_particle_setup_basic(make_color_rgb(255,255,0), (0.5 + random(1.5)), 0.5, 0.75*SEC);

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			
actor_buff_apply("armor_health", 1, [-50], "wasp_chase_penalty_health");
actor_buff_apply("armor_poise", 1, [-500], "wasp_chase_penalty_poise");