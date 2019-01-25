my_shoot_mod_select = undefined;
my_shoot_mod_cycle = 0;
my_shoot_mod_skip = ds_create("list");

my_shoot_mod_1 = global.hero_mod_1;
my_shoot_mod_2 = global.hero_mod_2;

my_shoot_aux_main = ds_create("list");
my_shoot_aux_1 = ds_create("list");
my_shoot_aux_2 = ds_create("list");

ds_list_copy(my_shoot_aux_1, global.hero_aux_1);
ds_list_copy(my_shoot_aux_2, global.hero_aux_2);

entity_run_type_scripts(("mod_shoot_" + my_shoot_mod_1));

action_shoot_create([
	/*bullet_type*/ [DefaultBullet, "HeroBullet4"],
	/*bullet_radius*/ my_shoot_bullet_radius,
	/*bullet_speed*/ my_shoot_bullet_speed,
	/*bullet_range*/ my_shoot_bullet_range,
	/*bullet_count*/ my_shoot_bullet_count,
	/*bullet_explosion*/ my_shoot_bullet_explosion,
	/*recoil_speed*/ 420*PPS,
	/*recoil_range*/ my_shoot_recoil_range,
	/*cast_value*/ my_shoot_cast_value,
	/*channel_value*/ my_shoot_channel_value,
	/*backswing_value*/ 0.2*SEC,
	/*cooldown_value*/ my_shoot_cooldown_value,
	/*combo_max*/ my_shoot_combo_max,
	/*damage*/ my_shoot_damage,
	/*flinch*/ my_shoot_flinch,
	/*push*/ my_shoot_push,
	/*flair_color*/ my_shoot_flair_color,
]);

my_charge_current = 0;
my_charge_accelerate_delay_value = 0.25*SEC;
my_charge_accelerate_delay_timer = 0;