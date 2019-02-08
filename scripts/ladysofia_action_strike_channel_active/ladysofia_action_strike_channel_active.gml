var particount = 5;

while(particount > 0){
	var p_spawn = my_strike_radius/2;
	var p_count = 2 + random(3);
	var p_model = game_particle_setup_basic(my_strike_color, (1 + random(2)), 0.35, 0.5*SEC);

	part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
	part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
	particount --;
};

actor_buff_apply("armor_health", 2, [50], "strike_health");
actor_buff_apply("armor_poise", 2, [50], "strike_poise");