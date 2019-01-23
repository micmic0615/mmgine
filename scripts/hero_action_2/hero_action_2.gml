var target_point = argument0;
ds_list_clear(my_shoot_aux_main);
ds_list_copy(my_shoot_aux_main, my_shoot_aux_2);
entity_run_type_scripts(("mod_shoot_" + my_shoot_mod_2));
entity_run_type_scripts(("aux_shoot_" + my_shoot_mod_2));
action_shoot_trigger_cancel(target_point);