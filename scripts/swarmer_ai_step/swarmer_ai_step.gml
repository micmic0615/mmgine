charger_ai_step();

if (my_clone_original == true){
	var me = id;
	with(object_index){
		if (my_clone_core == me && my_clone_original == false){
			ai_target_move_cooldown_timer = me.ai_target_move_cooldown_timer
		}
	}
	
	var current_phase = ai_boss_phase;
	
	if (status_health_current*100/status_health_max <= 40){
		ai_boss_phase = 3;
		my_attack_cast_armor_health = 70;
		my_attack_cooldown_value = 15*SEC;
		my_attack_cast_value = 9*SEC;
		my_attack_cast_movespeed = 1200*PPS;
	} else if (status_health_current*100/status_health_max <= 70){
		ai_boss_phase = 2;
		my_attack_cast_armor_health = 35;
		my_attack_cooldown_value = 14*SEC;
		my_attack_cast_value = 7*SEC;
		my_attack_cast_movespeed = 900*PPS;
	} else {
		ai_boss_phase = 1;
		my_attack_cooldown_value = 12*SEC;
		my_attack_cast_value = 5*SEC;
		my_attack_cast_movespeed = 600*PPS;
	}
	
	if (current_phase != ai_boss_phase){
		ds_list_clear(status_buff_list);
		actor_buff_apply("stunned", 0.25*SEC, [], "ai_stun");
		actor_buff_apply("immortal", 4*SEC, [], "ai_immortal");
		status_poise_current = status_poise_max;
		
		swarmer_action_3();
		
		with(object_index){
			if (my_clone_core == me && my_clone_original == false){
				ds_list_clear(status_buff_list);
				actor_buff_apply("stunned", 0.25*SEC, [], "ai_stun");
				actor_buff_apply("immortal", 4*SEC, [], "ai_immortal");
			}
		}
		
		if (ai_boss_phase == 3){
			var charger_spawn = actor_spawn(x ,y , Charger);
			charger_spawn.image_xscale = 1.75;
			charger_spawn.image_yscale = 1.75;
			charger_spawn.status_health_max = charger_spawn.status_health_max*3;
			charger_spawn.status_health_current = charger_spawn.status_health_max;
			charger_spawn.status_poise_max = charger_spawn.status_poise_max*1.5;
			charger_spawn.status_poise_current = charger_spawn.status_poise_max;
			
			var charger_spawn = actor_spawn(x ,y , Charger);
			charger_spawn.image_xscale = 1.75;
			charger_spawn.image_yscale = 1.75;
			charger_spawn.status_health_max = charger_spawn.status_health_max*3;
			charger_spawn.status_health_current = charger_spawn.status_health_max;
			charger_spawn.status_poise_max = charger_spawn.status_poise_max*1.5;
			charger_spawn.status_poise_current = charger_spawn.status_poise_max;
		
		}
		
	}
	
	var spawn_max = 0;
	switch(ai_boss_phase){
		case 2: spawn_max = 3; break;
		case 3: spawn_max = 5; break;
	}
	
	if (ai_spawn_cooldown_timer <= 0){
		var current_count = 0;
		with(Charger){if (animation_sprite == "Chargeling"){current_count ++}}
		
		if (current_count < spawn_max){
			ai_spawn_cooldown_timer = ai_spawn_cooldown_value;
			var charger_spawn = actor_spawn(x ,y , Charger);
			charger_spawn.status_health_max = charger_spawn.status_health_max*(0.2 + (0.1*ai_boss_phase));
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
