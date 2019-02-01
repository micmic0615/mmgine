if (my_chase_fire){
	var cast_value = 1 - (action_shoot_cast_timer / action_shoot_cast_value)
	action_shoot_trigger([my_chase_target.x,my_chase_target.y]);
	entity_move_point([my_chase_target.x, my_chase_target.y]);
	
	var p_spawn = 60;
	var p_count = 5;
	var p_model = game_particle_setup_basic(my_chase_color, (1 + random(2)*cast_value), 1 + 1.5*cast_value, 0.5*SEC);

	part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_spark,1);
	part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
	
	physics_gravity_current = 0;
	
	if (action_shoot_cast_timer <= 0){
		my_chase_fire = false;
	}
} else {
	my_chase_fire = false
	if (my_chase_active_timer > 0){
		my_chase_active_timer -= TIMESPEED;
		if (entity_enabled(my_chase_target)){
			var p_spawn = 90;
			var p_count = 3;
			var p_model = game_particle_setup_basic(make_color_rgb(255,255,0), (0.5 + random(1.5)), 0.5, 0.75*SEC);

			part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
			part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
			
			if (entity_room_age_modulo(0.1*SEC)){					
				entity_mirage_create(0.25*SEC, 0, 0, my_chase_color, 0.5);
			}
			
			actor_buff_apply("movespeed_set_raw", 3, [my_chase_movespeed_bonus], "wasp_chase_movespeed");
			actor_buff_apply("movesnap_set_raw", 3, [my_chase_movesnap_set], "wasp_chase_movesnap");
			actor_buff_apply("armor_health", 3, [-50], "wasp_chase_penalty_health");
			actor_buff_apply("armor_poise", 3, [-500], "wasp_chase_penalty_poise");
		
			animation_name = "dash";
			entity_move_point([my_chase_target.x, my_chase_target.y])
		
			if (distance_between(x,y,my_chase_target.x,my_chase_target.y) < 120){
				my_chase_active_timer = 0;
				my_chase_fire = true;
				
				entity_sfx_create_pulse(
					/*sprite*/ ExplosionBulletAlt_idle,
					/*duration*/ action_shoot_cast_value,
					/*blend*/ my_chase_color,
					/*style_data*/ [
						220,
						40,
						2
					]
				);
			}
		} else {
			my_chase_active_timer = 0;
		}
	
	} else {
		if (my_chase_cooldown_timer > 0){
			my_chase_cooldown_timer -= TIMESPEED;
		} else {
			my_chase_cooldown_timer = my_chase_cooldown_value;
		}
	}
}


