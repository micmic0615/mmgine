if (hero_passive_find("split")){
	hero_mod_shoot_split();
	if (action_dash_combo_count == action_dash_combo_max){
		action_dash_flair_color = my_shoot_flair_color
		action_dash_range = my_dash_range*1.5;
		
		var p_loop = 10;
		while(p_loop > 0){
			var p_count = 3;
			var p_model = game_particle_setup_basic(my_shoot_flair_color, (1 + random(2)), (1 + random(1)), ((0.5*SEC) + random(0.25*SEC)));
			
			hero_particles_create(80, p_model, p_count);
			p_loop --;
		}
	}
}