charger_ai_step();

if (my_clone_original == true){
	var me = id;
	with(object_index){
		if (my_clone_core == me && my_clone_original == false){
			ai_target_move_cooldown_timer = me.ai_target_move_cooldown_timer
		}
	}
	
	if (status_health_current*100/status_health_max <= 25){
		ai_boss_phase = 4;
		my_attack_cast_armor_health = 75;
		my_attack_cooldown_value = 16*SEC;
		my_attack_cast_value = 11*SEC;
		my_attack_cast_movespeed = 1080*PPS;
	} else if (status_health_current*100/status_health_max <= 50){
		ai_boss_phase = 3;
		my_attack_cast_armor_health = 50;
		my_attack_cooldown_value = 15*SEC;
		my_attack_cast_value = 9*SEC;
		my_attack_cast_movespeed = 920*PPS;
	} else if (status_health_current*100/status_health_max <= 75){
		ai_boss_phase = 2;
		my_attack_cast_armor_health = 25;
		my_attack_cooldown_value = 14*SEC;
		my_attack_cast_value = 7*SEC;
		my_attack_cast_movespeed = 780*PPS;
	} else {
		ai_boss_phase = 1;
		my_attack_cooldown_value = 12*SEC;
		my_attack_cast_value = 5*SEC;
		my_attack_cast_movespeed = 640*PPS;
	}
	
	var spawn_max = (ai_boss_phase - 1)*2;
	
	if (ai_spawn_cooldown_timer <= 0){
		var current_count = 0;
		with(Charger){if (animation_sprite == "Chargeling"){current_count ++}}
		
		if (current_count < spawn_max){
			ai_spawn_cooldown_timer = ai_spawn_cooldown_value;
			var charger_spawn = actor_spawn(x ,y , Charger);
			charger_spawn.status_health_max = charger_spawn.status_health_max*0.5;
			charger_spawn.status_health_current = charger_spawn.status_health_max;
			charger_spawn.status_poise_max = INFINITY;
			charger_spawn.status_poise_current = INFINITY;
			charger_spawn.status_damage_base = charger_spawn.status_damage_base*0.35;
			charger_spawn.status_damage_total = charger_spawn.status_damage_base;
			charger_spawn.animation_sprite = "Chargeling";
		}
	} else {
		ai_spawn_cooldown_timer -= TIMESPEED;
	}
}
