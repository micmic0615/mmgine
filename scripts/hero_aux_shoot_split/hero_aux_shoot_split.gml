for(var i = 0; i < ds_list_size(my_shoot_aux_main);i++){
	var p = ds_list_find_value(my_shoot_aux_main, i);
	switch(p){
		case "do": 
			my_shoot_bullet_radius *= 0.9;
			my_shoot_bullet_count += 2;
			my_shoot_damage = [
				(my_shoot_damage[0] * 0.9),
				(my_shoot_damage[1] * 0.9),
			];
			break;
			
		case "split":
			my_shoot_bullet_radius *= 0.8;
			my_shoot_bullet_count += 4;
			my_shoot_damage = [
				(my_shoot_damage[0] * 0.8),
				(my_shoot_damage[1] * 0.8),
			];
			break;
			
		case "ping":
			my_shoot_cast_value *= 0.65;
			my_shoot_channel_value *= 0.65;
			break
			
		case "crash":
			my_shoot_flinch = [
				(my_shoot_flinch[0] * 1.4),
				(my_shoot_flinch[1] * 1.2),
			];
			break
			
		case "load":
			my_shoot_bullet_explosion *= 2;
			my_shoot_damage = [
				(my_shoot_damage[0] * 1),
				(my_shoot_damage[1] * 1.4),
			];
			break
		
		case "breach":
			action_shoot_bullet_collision_destroy_value += 1;
			my_shoot_damage = [
				(my_shoot_damage[0] * 0.7),
				(my_shoot_damage[1] * 0.7),
			];
			break
		
		case "focus":
			my_shoot_combo_max = 5;
			my_charge_factor_size = 1.35;
			my_charge_factor_damage = 2.5;
			my_charge_factor_explosion = 1.25;
			break
	}
}

hero_mod_shoot_apply();