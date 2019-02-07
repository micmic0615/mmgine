var dir = argument0;
ds_list_clear(my_shoot_mod_skip);
switch(my_shoot_mod_select){
	case 0:			
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_beatdown_list, 0));
		ds_list_replace(my_beatdown_list, 1, hero_skill_set_shoot_modname(dir));
		break
	
	case 1:			
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_beatdown_list, 1));
		ds_list_replace(my_beatdown_list, 0, hero_skill_set_shoot_modname(dir));
		break
		
	case 2:			
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_1, 1));
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_1, 0));
		ds_list_replace(my_shoot_aux_1, 2, hero_skill_set_shoot_modname(dir));
		break
		
	case 3:
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_1, 2));
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_1, 0));
		ds_list_replace(my_shoot_aux_1, 1, hero_skill_set_shoot_modname(dir));
		break
		
	case 4:
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_1, 2));
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_1, 1));
		ds_list_replace(my_shoot_aux_1, 0, hero_skill_set_shoot_modname(dir));
		break
		
	case 5:		
		ds_list_add(my_shoot_mod_skip, my_shoot_mod_2);
		my_shoot_mod_1 = hero_skill_set_shoot_modname(dir);
		entity_run_type_scripts(("mod_shoot_" + my_shoot_mod_1));
		my_charge_color_1 = my_shoot_color;
		break
		
	case 6:
		ds_list_add(my_shoot_mod_skip, my_shoot_mod_1);
		my_shoot_mod_2 = hero_skill_set_shoot_modname(dir);
		entity_run_type_scripts(("mod_shoot_" + my_shoot_mod_2));
		my_charge_color_2 = my_shoot_color;
		break
		
	case 7:
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_2, 2));
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_2, 1));
		ds_list_replace(my_shoot_aux_2, 0, hero_skill_set_shoot_modname(dir));
		break
		
	case 8:
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_2, 2));
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_2, 0));
		ds_list_replace(my_shoot_aux_2, 1, hero_skill_set_shoot_modname(dir));
		break
		
	case 9:
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_2, 1));
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_shoot_aux_2, 0));
		ds_list_replace(my_shoot_aux_2, 2, hero_skill_set_shoot_modname(dir));
		break	
		
	case 10:			
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_passive_list, 1));
		ds_list_replace(my_passive_list, 0, hero_skill_set_shoot_modname(dir));
		hero_skill_set_passive();
		break
	
	case 11:			
		ds_list_add(my_shoot_mod_skip, ds_list_find_value(my_passive_list, 0));
		ds_list_replace(my_passive_list, 1, hero_skill_set_shoot_modname(dir));
		hero_skill_set_passive();
		break
}

global.hero_mod_1 = my_shoot_mod_1;
global.hero_mod_2 = my_shoot_mod_2;

ds_list_clear(global.hero_aux_1);
ds_list_clear(global.hero_aux_2);
ds_list_copy(global.hero_aux_1, my_shoot_aux_1);
ds_list_copy(global.hero_aux_2, my_shoot_aux_2);

ds_list_clear(global.hero_beatdown_list);
ds_list_copy(global.hero_beatdown_list, my_beatdown_list);

ds_list_clear(global.hero_passive_list);
ds_list_copy(global.hero_passive_list, my_passive_list);