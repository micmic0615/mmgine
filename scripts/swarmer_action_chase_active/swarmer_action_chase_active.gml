var p_spawn = 90;
var p_count = 3;
var p_model = game_particle_setup_basic(action_chase_color, (0.5 + random(1.5)), 0.5, 0.75*SEC);

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			
actor_buff_apply("armor_health", 3, [50], "chase_bonus_health");
actor_buff_apply("armor_poise", 3, [50], "chase_bonus_poise");


