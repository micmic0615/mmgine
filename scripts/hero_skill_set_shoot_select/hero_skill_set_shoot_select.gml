var dir = argument0;

if (ACTIVE && ALIVE){
	if (sign(dir) == 1){
		if (my_shoot_mod_select == undefined){
			my_shoot_mod_select = 0
		} else if (my_shoot_mod_select < 7){
			my_shoot_mod_select += 1
		} else {
			my_shoot_mod_select = undefined
		}
	} else if (sign(dir) == -1){
		if (my_shoot_mod_select == undefined){
			my_shoot_mod_select = 7
		} else if (my_shoot_mod_select > 0){
			my_shoot_mod_select -= 1
		} else {
			my_shoot_mod_select = undefined
		}
	}

	switch(my_shoot_mod_select){
		case 0:
			hero_skill_get_index(ds_list_find_value(my_shoot_aux_1, 2));
			break
		
		case 1:
			hero_skill_get_index(ds_list_find_value(my_shoot_aux_1, 1));
			break
		
		case 2:
			hero_skill_get_index(ds_list_find_value(my_shoot_aux_1, 0));
			break
		
		case 3:
			hero_skill_get_index(my_shoot_mod_1);
			break
		
		case 4:
			hero_skill_get_index(my_shoot_mod_2);
			break
		
		case 5:
			hero_skill_get_index(ds_list_find_value(my_shoot_aux_2, 0));
			break
		
		case 6:
			hero_skill_get_index(ds_list_find_value(my_shoot_aux_2, 1));
			break
		
		case 7:
			hero_skill_get_index(ds_list_find_value(my_shoot_aux_2, 2));
			break		
	}
}