var can_move = argument0;
var distance = argument1;

ai_attack_ranged_cooldown_value = 1.25*SEC;
ai_attack_melee_cooldown_value = 6*SEC;
ai_attack_barrage_cooldown_value = 3*SEC;
ai_attack_strike_cooldown_value = 15*SEC;

ai_attack_extra_cooldown = 0.5*SEC;

if (distance < 1400){
	if (
		ai_attack_barrage_active || 
		ai_attack_melee_active || 
		ai_attack_strike_active ||
		ai_attack_strike_cooldown_timer <= 0 ||
		ai_attack_melee_cooldown_timer <= 0 || 
		ai_attack_barrage_cooldown_timer <= 0
	){
		if (ai_attack_strike_active){
			entity_move_point([ai_target.x,ai_target.y]);
			action_strike_trigger(ai_target)
			if (action_strike[?"sequence"] == 1){
				ai_attack_strike_combo_can_add = true;
				ai_attack_strike_combo_can_jump = true
			}
			if (action_strike[?"sequence"] == 2){
				if (ai_attack_strike_combo_can_add){
					if (ai_attack_strike_combo_count < 1){
						ai_attack_strike_combo_count++;						
					} else {
						ladysofia_ai_attack_rest();
						ai_attack_strike_active = false;
						ai_attack_strike_combo_count = 0;
						ai_attack_strike_cooldown_timer = ai_attack_strike_cooldown_value;
					}
					ai_attack_strike_combo_can_add = false;
				}
			}
			
			if (action_strike[?"sequence"] == 3){
				if (ai_attack_strike_combo_can_jump){
					entity_sfx_create_pulse(
						/*sprite*/ ExplosionBulletAlt_idle,
						/*duration*/ 0.4*SEC,
						/*blend*/ my_invoke_color_1,
						/*style_data*/ [
							40,
							180,
							2
						]
					)
					if (ai_attack_strike_combo_count <= 1){
						x = ai_target.x;
						y = ai_target.y;
						entity_motion_push(120, 0.5*SEC, random(360));
					}
					ai_attack_strike_combo_can_jump = false;
				}
			}
		} else if (ai_attack_barrage_active){
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
			ladysofia_action_shoot_ranged_trigger(ai_target);			
			if (action_shoot[?"sequence"] == 2){
				if (random(100) <= 60){
					ai_attack_ranged_cooldown_timer = ai_attack_ranged_cooldown_value;
					if (distance < 540){
						action_dash_trigger([x + random_mirror(200), y + random_mirror(200)])
					} else {
						action_dash_trigger([ai_target.x  + random_mirror(400), ai_target.y  + random_mirror(400)])
					}
				} else {
					ai_attack_ranged_cooldown_timer = 0.25*SEC
				}
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