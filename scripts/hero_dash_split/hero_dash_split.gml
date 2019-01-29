if (hero_passive_find("split")){
	
	if (action_dash_combo_count == action_dash_combo_max){
		hero_mod_shoot_split();
		
		action_dash_flair_color = my_shoot_flair_color
		action_dash_range = my_dash_range*1.5;
		
		hero_dash_particles_create(10, 4, 2);
	}
}