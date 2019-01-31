//shooter_step();

if (actor_actions_enabled){
	var count = 0;
	var me = id;
	with(BULLET){if (bullet_origin == me){count ++}};

	if (count >= my_attack_bullets_max){
		my_attack_cooldown_timer = my_attack_cooldown_value;
	}
}
