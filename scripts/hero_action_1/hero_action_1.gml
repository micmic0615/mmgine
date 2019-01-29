var target_point = argument0;
my_charge_current = my_charge_meter_1;
my_charge_active = 1;
ds_list_clear(my_shoot_aux_main);
ds_list_copy(my_shoot_aux_main, my_shoot_aux_1);
entity_run_type_scripts(("mod_shoot_" + my_shoot_mod_1));
entity_run_type_scripts(("aux_shoot_" + my_shoot_mod_1));
action_shoot_trigger(target_point);
