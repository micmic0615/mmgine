var can_move = argument0;
var distance = argument1;

ai_attack_ranged_cooldown_value = 2.5*SEC;
ai_attack_melee_cooldown_value = 8*SEC;
ai_attack_barrage_cooldown_value = 4*SEC;
ai_attack_strike_cooldown_value = 21*SEC;

ai_attack_extra_cooldown = 2*SEC;

if (distance < 1200){
	if (
		ai_attack_barrage_active || 
		ai_attack_melee_active || 
		ai_attack_strike_active ||
		ai_attack_strike_cooldown_timer <= 0 ||
		ai_attack_melee_cooldown_timer <= 0 || 
		ai_attack_barrage_cooldown_timer <= 0
	){
		if (ai_attack_barrage_active){
			entity_move_point([ai_target.x,ai_target.y]);
			action_barrage_trigger(ai_target)
			if (action_barrage[?"sequence"] == 2){
				ladysofia_ai_attack_rest();
				ai_attack_barrage_active = false;	
				ai_attack_barrage_cooldown_timer = ai_attack_barrage_cooldown_value;	
				
			}
		} else if (ai_attack_melee_active){
			entity_move_point([ai_target.x,ai_target.y]);
			ladysofia_action_shoot_melee_trigger(ai_target)
			if (action_shoot[?"sequence"] == 2){
				ladysofia_ai_attack_rest();
				ai_attack_melee_active = false;
				ai_attack_melee_cooldown_timer = ai_attack_melee_cooldown_value;				
			}
		} if (ai_attack_strike_active){
			entity_move_point([ai_target.x,ai_target.y]);
			action_strike_trigger(ai_target)
			if (action_strike[?"sequence"] == 2){
				ladysofia_ai_attack_rest();
				ai_attack_strike_active = false;
				ai_attack_strike_cooldown_timer = ai_attack_strike_cooldown_value;
			}
		} else {
			if (ai_attack_barrage_cooldown_timer <= 0 && distance < 120){
				ai_attack_barrage_active = true;
			} else if(ai_attack_melee_cooldown_timer <= 0 && distance < 180) {
				ai_attack_melee_active = true;
			} else if (ai_attack_strike_cooldown_timer <= 0 && distance < 240){
				ai_attack_strike_active = true;
			} else {
				ladysofia_ai_can_dash_chase();
			}
		}
	} else {
		if (distance < 580){
			ai_attack_barrage_cooldown_timer -= TIMESPEED;
		} else {
			ai_attack_melee_cooldown_timer -= TIMESPEED;
		}
		
		if (ai_attack_strike_cooldown_timer > 0){
			ai_attack_strike_cooldown_timer -= TIMESPEED;
		} 
		
		if (ai_attack_ranged_cooldown_timer <= 0){
			if (ladysofia_action_shoot_ranged_trigger(ai_target)){
				ai_attack_ranged_cooldown_timer = ai_attack_ranged_cooldown_value
			}
		}
	}
} else {
	ladysofia_ai_can_dash_chase();
}

if (ai_attack_ranged_cooldown_timer > 0){
	ai_attack_ranged_cooldown_timer -= TIMESPEED;
} 

return can_move;