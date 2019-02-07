for(var i = 0; i < ds_list_size(my_shoot_aux_main);i++){
	var p = ds_list_find_value(my_shoot_aux_main, i);
	switch(p){
		case "do": 
			my_shoot_bullet_explosion += 60;
			my_shoot_damage = [
				(my_shoot_damage[0] * 0.8),
				(my_shoot_damage[1] * 1.35),
			];
			break;
			
		case "split":
			my_shoot_bullet_radius *= 0.7;
			my_shoot_bullet_count += 1;
			action_shoot_angle_spead = 180;
			my_shoot_bullet_explosion *= 0.85;
			my_shoot_damage = [
				(my_shoot_damage[0] * 0.75),
				(my_shoot_damage[1] * 0.75),
			];
			
			my_shoot_flinch = [
				(my_shoot_flinch[0] * 0.5),
				(my_shoot_flinch[1] * 0.5),
			];
			break;
			
		case "ping":
			my_shoot_cast_value *= 0.65;
			my_shoot_channel_value *= 0.65;
			break
			
		case "crash":
			my_shoot_flinch = [
				(my_shoot_flinch[0] * 1),
				(my_shoot_flinch[1] * 1.75),
			];
			break
			
		case "load":
			my_shoot_bullet_explosion += 120;
			my_shoot_damage = [
				(my_shoot_damage[0] * 0.7),
				(my_shoot_damage[1] * 1.5),
			];
			break
		
		case "breach":
			my_shoot_bullet_speed = 540*PPS;
			my_shoot_bullet_range = 420;
			action_shoot_bullet_collision_impact_health += 1;
			break
		
		case "focus":
			my_charge_factor_speed *= 4;
			my_charge_factor_damage = 2.75;
			my_charge_factor_explosion *= 1.35;
			break
	}
}

hero_skill_set_shoot_mod_apply();