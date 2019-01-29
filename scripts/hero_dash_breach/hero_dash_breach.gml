if (hero_passive_find("breach")){
	hero_mod_shoot_breach();
	
	var p_loop = 5;
	while(p_loop > 0){
		var p_count = 3;
		var p_model = game_particle_setup_basic(my_shoot_flair_color, (1 + random(2)), (1 + random(1)), ((0.5*SEC) + random(0.25*SEC)));
			
		hero_particles_create(80, p_model, p_count);
		p_loop --;
	}
}