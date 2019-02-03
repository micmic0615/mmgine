if (actor_actions_id == "shoot"){
	my_charge_meter = min(my_charge_meter + (TIMESPEED*2), my_charge_max);
	
	var charge_value = my_charge_meter/my_charge_max;
	if (charge_value > 0.95){charge_value = 1}
	
	if (action_shoot_cast_timer > 0){
		var p_spawn = 60;
		var p_count = 2;
		var p_model = game_particle_setup_basic(make_color_rgb(255,80,80), (0.75 + random(1)*charge_value), 0.5 + 0.75*charge_value, 0.5*SEC);

		part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),ps_shape_ellipse,1);
		part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
		
		actor_buff_apply("speed_bonus_percent", 0.1*SEC, [-50], "shooter_charging");
		
		physics_gravity_current = 0;
	}
}