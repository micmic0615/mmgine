if (actor_actions_enabled && my_heal_cooldown_timer <= 0){
	if (!my_heal_active){
		my_heal_active = 0.1*SEC;
		actor_actions_id = "heal";
		my_heal_cast_timer = my_heal_cast_value;
	} else {
		my_heal_active = 0.1*SEC;
		actor_actions_id = "heal";
		my_heal_cast_timer -= TIMESPEED;
		my_charge_meter_1 -= TIMESPEED*10;
		my_charge_meter_2 -= TIMESPEED*10;
		
		if (my_charge_meter_1 < 0){my_charge_meter_1 = 0}
		if (my_charge_meter_2 < 0){my_charge_meter_2 = 0}
	}
}