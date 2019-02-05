if (my_frenzy_timer > 0){
	enemy_attack_range_total = INFINITY;
	action_shoot_cooldown_timer = 0;
	
	action_shoot_cast_value = 0.4*SEC;
	my_frenzy_timer--;
	
	var p_spawn = 60;
	var p_count = 4;
	var p_model = game_particle_setup_basic(make_color_rgb(255,0,80), (1.5 + random(1.5)), 1, 0.5*SEC);

	part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
	part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
		
	actor_buff_apply("speed_bonus_percent", 0.1*SEC, [-50], "shooter_charging");
} else {
	enemy_attack_range_total = enemy_attack_range_base;
	action_shoot_cast_value = my_shoot_cast_value;
}