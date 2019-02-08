if (actor_actions_idle != true){
	actor_buff_apply("regen_poise", 1, [status_poise_regen_base*-1], "attack_balancer");
}

switch (my_invoke_boss_phase){
	case 1:
		var particount = 3;

		while(particount > 0){
			var p_spawn = 120;
			var p_count = 1 + random(2);
			var p_model = game_particle_setup_basic(my_invoke_color_1, (0.5 + random(1)), 0.5, 0.35*SEC);

			part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
			part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			particount --;
		};
		break
		
	case 2:
		var particount = 4;

		while(particount > 0){
			var p_spawn = 120;
			var p_count = 1 + random(2);
			var p_model = game_particle_setup_basic(my_invoke_color_2, (0.75 + random(1.5)), 1.5, 0.35*SEC);

			part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
			part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			particount --;
		};
		break
}