if (hero_passive_find("load")){
	hero_mod_shoot_load();
	var bullet = hero_bullet_create([
		0,
		0,
		0, 
		1,
		0,
		my_shoot_bullet_type,
		my_shoot_flair_color,
		0, 
		0,
		false
	]);
	
	bullet.bullet_seek_range = 0;
	
	var explosion_radius = 280;
	var explosion_damage_factor = 0.4;
	var explosion_push = 40
	
	bullet.bullet_death_spawn_trigger = "always";
		
	bullet.bullet_death_spawn[?"explosion_radius_max"] = explosion_radius;
	bullet.bullet_death_spawn[?"explosion_lifespan_base"] = explosion_radius/(640*PPS);
	bullet.bullet_death_spawn[?"explosion_lifespan_current"] = explosion_radius/(640*PPS);;
	bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = my_shoot_flair_color;
	bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
	bullet.bullet_death_spawn[?"status_immortal"] = true;
	
	bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
		["damage", "actor", status_damage_total*explosion_damage_factor, true, "main_attack"],
		["push", "actor", explosion_push, 0.5*SEC, "center", ["multiply",1.5]],
	]
	
	hero_dash_particles_create(5, 3, 1);
}