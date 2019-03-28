if (my_shoot_mod_1 == "do"){
	my_shoot_mod_1 = "split";
	entity_run_type_scripts("mod_shoot_split");
	my_charge_color_1 = my_shoot_color;

	my_shoot_mod_2 = "load";
	entity_run_type_scripts("mod_shoot_load");
	my_charge_color_2 = my_shoot_color;
} else {
	my_shoot_mod_1 = "do";
	entity_run_type_scripts("mod_shoot_do");
	my_charge_color_1 = my_shoot_color;

	my_shoot_mod_2 = "crash";
	entity_run_type_scripts("mod_shoot_crash");
	my_charge_color_2 = my_shoot_color;
}

entity_sfx_create_pulse(
	/*sprite*/ ExplosionBulletAlt_idle,
	/*duration*/ 0.35*SEC,
	/*blend*/ my_charge_color_1,
	/*style_data*/ [
		180,
		60,
		1.5
	]
)
	
entity_sfx_create_pulse(
	/*sprite*/ ExplosionBulletAlt_idle,
	/*duration*/ 0.25*SEC,
	/*blend*/ my_charge_color_2,
	/*style_data*/ [
		40,
		160,
		1
	]
)

my_charge_meter_1 = 0;
my_charge_meter_2 = 0;

global.hero_mod_1 = my_shoot_mod_1;
global.hero_mod_2 = my_shoot_mod_2;