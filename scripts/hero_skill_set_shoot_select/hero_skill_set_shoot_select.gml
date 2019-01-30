var dir = argument0;

if (entity_enabled()){
	if (sign(dir) == 1){
		if (my_shoot_mod_select == undefined){
			my_shoot_mod_select = 6
		} else if (my_shoot_mod_select < 11){
			my_shoot_mod_select += 1
		} else {
			my_shoot_mod_select = undefined
		}
	} else if (sign(dir) == -1){
		if (my_shoot_mod_select == undefined){
			my_shoot_mod_select = 5
		} else if (my_shoot_mod_select > 0){
			my_shoot_mod_select -= 1
		} else {
			my_shoot_mod_select = undefined
		}
	}

	switch(my_shoot_mod_select){
		case 0:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_beatdown_list, 1));
			break
		
		case 1:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_beatdown_list, 0));
			break
		
		case 2:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_shoot_aux_1, 2));
			break
		
		case 3:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_shoot_aux_1, 1));
			break
		
		case 4:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_shoot_aux_1, 0));
			break
		
		case 5:
			my_shoot_mod_cycle = hero_skill_get_index(my_shoot_mod_1);
			break
		
		case 6:
			my_shoot_mod_cycle = hero_skill_get_index(my_shoot_mod_2);
			break
		
		case 7:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_shoot_aux_2, 0));
			break
		
		case 8:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_shoot_aux_2, 1));
			break
		
		case 9:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_shoot_aux_2, 2));
			break		
			
		case 10:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_passive_list, 0));
			break	
		
		case 11:
			my_shoot_mod_cycle = hero_skill_get_index(ds_list_find_value(my_passive_list, 1));
			break	
	}
	
	
}