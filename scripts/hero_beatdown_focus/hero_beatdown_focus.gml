var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var me = id;
hero_mod_shoot_focus();

my_charge_permabuff = 3.25*SEC;

entity_sfx_create_pulse(
	/*sprite*/ ExplosionBulletAlt_idle,
	/*duration*/ my_charge_permabuff,
	/*blend*/ me.my_shoot_color,
	/*style_data*/ [
		160,
		40,
		2
	]
);