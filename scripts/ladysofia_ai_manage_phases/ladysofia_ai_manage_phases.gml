var can_move = argument0;

switch(my_invoke_boss_phase){
	case 0:
		if (status_health_current/status_health_max < 0.6){
			can_move = !action_invoke_trigger(id);
			if (!can_move){
				ai_attack_ranged_cooldown_timer = random(1.25)*SEC;
				ai_attack_melee_cooldown_timer  = random(6)*SEC;
				ai_attack_barrage_cooldown_timer  = random(3)*SEC;
				ai_attack_strike_cooldown_timer = random(15)*SEC;
			}
		}
		break
		
	case 1:
		if (status_health_current/status_health_max < 0.3){
			can_move = !action_invoke_trigger(id);
			if (!can_move){
				ai_attack_ranged_cooldown_timer = random(1)*SEC;
				ai_attack_melee_cooldown_timer  = random(3)*SEC;
				ai_attack_barrage_cooldown_timer  = random(2)*SEC;
				ai_attack_strike_cooldown_timer = random(8)*SEC;
			}
		}
		break
}

return can_move