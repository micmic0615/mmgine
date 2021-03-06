for(var i = 0; i < ds_list_size(my_shoot_aux_main);i++){
	var p = ds_list_find_value(my_shoot_aux_main, i);
	switch(p){
		case "do": 			
			my_shoot_flinch = [
				(my_shoot_flinch[0] * 1.25),
				(my_shoot_flinch[1] * 1.25),
			];
			break;
			
		case "split":
			my_shoot_bullet_radius *= 0.6;
			my_shoot_bullet_count += 1;
			my_shoot_bullet_seek_range *= 0.8;
			my_shoot_bullet_seek_turn_rate *= 0.9;
			my_shoot_bullet_angle_spread = 90;
			
			my_shoot_damage = [
				(my_shoot_damage[0] * 0.7),
				(my_shoot_damage[1] * 0.7),
			];
			
			my_shoot_flinch = [
				(my_shoot_flinch[0] * 0.6),
				(my_shoot_flinch[1] * 0.6),
			];
			break;
			
		case "ping":
			my_shoot_cast_value *= 0.75;
			my_shoot_channel_value *= 0.75;
			break
			
		case "crash":
			my_shoot_damage = [
				(my_shoot_damage[0] * 1.25),
				(my_shoot_damage[1] * 1.25),
			];
			
			my_shoot_flinch = [
				(my_shoot_flinch[0] * 1.6),
				(my_shoot_flinch[1] * 1.6),
			];
			break
			
		case "load":
			my_shoot_bullet_explosion_radius += 200;
			my_shoot_flinch = [
				(my_shoot_flinch[0] * 0.8),
				(my_shoot_flinch[1] * 2),
			];
			break
		
		case "breach":
			my_shoot_bullet_impact_health += 1;
			my_shoot_damage = [
				(my_shoot_damage[0] * 0.8),
				(my_shoot_damage[1] * 0.8),
			];
			break
		
		case "focus":
			my_charge_factor_speed = 1.25;
			my_charge_factor_range = 1.5;
			my_charge_divider_cast = 3;
			my_charge_factor_flinch = 5;
			my_charge_factor_damage = 2.5;
			break
	}
}

hero_skill_set_shoot_mod_apply();