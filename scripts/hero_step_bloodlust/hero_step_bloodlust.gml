if (my_bloodlust_trigger_timer > 0){
	my_bloodlust_trigger_timer -= TIMESPEED;
}

if (my_bloodlust_attack_cooldown_timer > 0){
	my_bloodlust_attack_cooldown_timer -= TIMESPEED
}

if (my_bloodlust_active_timer > 0){
	my_bloodlust_active_timer -= TIMESPEED;
	actor_buff_apply("speed_bonus_percent", 0.15*SEC, [50], "bloodlust_speed");
	
	var p_model_1 = game_particle_setup_basic(c_red, (1 + random(1)), 0.35, 0.35*SEC, pt_shape_flare);
	hero_particles_create(100, p_model_1, 4);
	
	if (entity_room_age_modulo(0.1*SEC)){
		entity_mirage_create(0.25*SEC, random_mirror(60), random_mirror(60), make_color_rgb(255,0,0), 0.2)
	}
} else {
	my_bloodlust_active_level = 2;
}