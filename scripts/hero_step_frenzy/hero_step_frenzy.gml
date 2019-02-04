if (my_frenzy_timer > 0){
	my_frenzy_timer -= TIMESPEED;	
	var p_model_1 = game_particle_setup_basic( make_color_rgb(255,0,150), (1 + random(2)), 0.35, 0.5*SEC, pt_shape_flare);
	hero_particles_create(100, p_model_1, 4);
}