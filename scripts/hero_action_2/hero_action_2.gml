var target_point = argument0;
my_charge_current = my_charge_meter_2;
my_charge_active = 2;
ds_list_clear(my_shoot_aux_main);
ds_list_copy(my_shoot_aux_main, my_shoot_aux_2);
entity_run_type_scripts(("mod_shoot_" + my_shoot_mod_2));
entity_run_type_scripts(("aux_shoot_" + my_shoot_mod_2));
hero_shoot_frenzy();

action_shoot_trigger(target_point);
//action_strike_trigger(target_point);