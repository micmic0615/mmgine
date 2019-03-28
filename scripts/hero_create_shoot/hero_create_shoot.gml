my_shoot_mod_select = undefined;
my_shoot_mod_cycle = 0;
my_shoot_mod_skip = ds_create("list");

my_shoot_aim_mode = false;
my_shoot_aim_dash_disable_timer = 0;
my_shoot_aim_dash_disable_value = 1.5*SEC;

my_shoot_target_mode = false;
my_shoot_target_mode_x = 0;
my_shoot_target_mode_y = 0;

my_shoot_mod_1 = global.hero_mod_1;
my_shoot_mod_2 = global.hero_mod_2;

my_shoot_aux_main = ds_create("list");
my_shoot_aux_1 = ds_create("list");
my_shoot_aux_2 = ds_create("list");

ds_list_copy(my_shoot_aux_1, global.hero_aux_1);
ds_list_copy(my_shoot_aux_2, global.hero_aux_2);

entity_run_type_scripts(("mod_shoot_" + my_shoot_mod_2));
my_charge_color_2 = my_shoot_color;

entity_run_type_scripts(("mod_shoot_" + my_shoot_mod_1));
my_charge_color_1 = my_shoot_color;

my_charge_current = 0;
my_charge_accelerate_delay_value = 0.25*SEC;
my_charge_accelerate_delay_timer = 0;