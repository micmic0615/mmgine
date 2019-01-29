if (hero_passive_find("ping")){
	hero_mod_shoot_ping();
	actor_buff_apply("speed_bonus_percent", 2*SEC, [75], "ping_speed_burst");
	
	hero_dash_particles_create(5, 3, 1);
}