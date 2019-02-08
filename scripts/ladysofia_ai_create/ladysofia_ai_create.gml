ai_create();
ai_type_id = "ladysofia";

ai_attack_ranged_cooldown_timer = 0;
ai_attack_ranged_cooldown_value = 1*SEC;

ai_attack_melee_cooldown_timer = random(5)*SEC;
ai_attack_melee_cooldown_value = 1*SEC;
ai_attack_melee_active = false;
ai_attack_melee_combo_count = 0;
ai_attack_melee_combo_can_add = true;
ai_attack_melee_combo_can_jump = true;

ai_attack_barrage_cooldown_timer = random(10)*SEC;
ai_attack_barrage_cooldown_value = 1*SEC;
ai_attack_barrage_active = false;

ai_attack_strike_cooldown_timer = random(15)*SEC;
ai_attack_strike_cooldown_value = 1*SEC;
ai_attack_strike_active = false;
ai_attack_strike_combo_count = 0;
ai_attack_strike_combo_can_add = true;
ai_attack_strike_combo_can_jump = true;

ai_attack_extra_cooldown = 1.5*SEC;