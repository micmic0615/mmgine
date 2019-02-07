for(var i = 0; i < ds_list_size(my_shoot_aux_main);i++){
	var p = ds_list_find_value(my_shoot_aux_main, i);
	switch(p){
		case "do": 
			my_shoot_bullet_impact_health += 1;
			my_shoot_bullet_seek_range *= 1.1;
			my_shoot_bullet_seek_turn_rate *= 1.1;
			my_shoot_bullet_range *= 1.15;
			my_shoot_damage = [
				(my_shoot_damage[0] * 1.05),
				(my_shoot_damage[1] * 1.05),
			];
			break;
			
		case "split":
			my_shoot_bullet_radius *= 0.6;
			my_shoot_bullet_count += 1;
			my_shoot_bullet_seek_range *= 0.7;
			my_shoot_bullet_seek_turn_rate *= 0.8;
			my_shoot_bullet_angle_spread = 120;
			
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
			my_shoot_cast_value *= 0.65;
			my_shoot_channel_value *= 0.65;
			break
			
		case "crash":
			my_shoot_flinch = [
				(my_shoot_flinch[0] * 2),
				(my_shoot_flinch[1] * 1),
			];
			break
			
		case "load":
			my_shoot_bullet_explosion_radius += 240;
			my_shoot_damage = [
				(my_shoot_damage[0] * 1),
				(my_shoot_damage[1] * 2.5),
			];
			break
		
		case "breach":
			my_shoot_bullet_impact_health += 10;
			my_shoot_bullet_seek_range *= 1.2;
			my_shoot_bullet_seek_turn_rate *= 1.2;
			my_shoot_bullet_range *= 1.3;
			my_shoot_damage = [
				(my_shoot_damage[0] * 1.1),
				(my_shoot_damage[1] * 1.1),
			];
			break
		
		case "focus":
			my_charge_factor_range = 1.25;
			my_charge_factor_size = 1.5;
			my_charge_factor_damage = 2.75;
			my_charge_divider_cast = 3;
			break
	}
}

hero_skill_set_shoot_mod_apply();