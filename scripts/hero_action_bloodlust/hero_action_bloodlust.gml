my_bloodlust_trigger_timer += my_bloodlust_trigger_gain;

if (my_bloodlust_active_timer <= 0){
	if (my_bloodlust_trigger_timer >= my_bloodlust_trigger_treshold){
		my_bloodlust_trigger_timer = 0;
		my_bloodlust_active_timer = my_bloodlust_active_value;
		
		entity_draw_text_following("bloodlust!", [cos(degtorad(270))*25, sin(degtorad(270))*25], 1.5*SEC, c_white, 18);
		room_timespeed_temp(0.01, 1*SEC, true);
		actor_buff_apply("immortal", 1*SEC, [], "autoshield");
		
		var p_loop = 15;
		while(p_loop > 0){
			var p_count = 3;
			
			
			
			var p_model = game_particle_setup_basic(make_color_rgb(255,30,30), (5 + random(15)), (2 + random(2)), ((0.5*SEC) + random(0.25*SEC)), pt_shape_flare);
			
			hero_particles_create(80, p_model, p_count);
			p_loop --;
		}
	}
} else {
	if (my_bloodlust_trigger_timer >= my_bloodlust_trigger_treshold){
		my_bloodlust_trigger_timer = 0;
		my_bloodlust_active_level += 1
		if (my_bloodlust_active_level > my_bloodlust_active_level_cap){
			my_bloodlust_active_level = my_bloodlust_active_level_cap;
		}
	}
	
	my_bloodlust_active_timer = min(my_bloodlust_active_timer + my_bloodlust_active_regain, my_bloodlust_active_value)
}
