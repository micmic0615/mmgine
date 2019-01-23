var charge_value = my_charge_current < my_charge_min ? 0 : my_charge_current/my_charge_max;

var bonus_size = my_charge_factor_size - 1;
var bonus_speed = my_charge_factor_speed - 1
var bonus_damage = my_charge_factor_damage - 1;
var bonus_flinch = my_charge_factor_flinch - 1;

if (charge_value == 1){
	action_shoot_combo_count = -1;
}

var max_combo = (action_shoot_combo_count % action_shoot_combo_max) == (action_shoot_combo_max - 1);

if (max_combo){
	//bonus_size += 1;
	//bonus_speed += 0.25;
	//bonus_damage += 0.5;
	//bonus_flinch += 1;
	charge_value = 1;
}

if (charge_value == 1){
	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ 0.35*SEC*TIMESPEED,
		/*blend*/ my_shoot_flair_color,
		/*style_data*/ [
			150,
			30,
			2
		]
	)
}

action_shoot_bullet_radius = my_shoot_bullet_radius * (1 + (charge_value*bonus_size));
action_shoot_bullet_speed = my_shoot_bullet_speed * (1 + (charge_value*bonus_speed));
action_shoot_bullet_explosion = my_shoot_bullet_explosion * (1 + (charge_value*bonus_size*0.3));

action_shoot_damage = [
	my_shoot_damage[0] * (1 +  (charge_value*bonus_damage)),
	my_shoot_damage[1] * (1 +  (charge_value*bonus_damage)),
];

var flinch_multiplier = 1;
action_shoot_recoil_range = my_shoot_recoil_range*2
if (charge_value < 1){
	status_poise_current = max(0, (1 - my_shoot_poise_cost)*status_poise_current);
	flinch_multiplier = status_poise_current/status_poise_max;
	action_shoot_recoil_range = (my_shoot_recoil_range*flinch_multiplier*0.65) + (my_shoot_recoil_range*0.35);
}

if (max_combo){
	action_shoot_recoil_range += my_shoot_recoil_range*0.5;
}

var diminishing_flinch_main = my_shoot_flinch[0] * flinch_multiplier;
var diminishing_flinch_explosion = my_shoot_flinch[1] * flinch_multiplier;

action_shoot_flinch = [
	diminishing_flinch_main * (1 +  (charge_value*bonus_flinch)),
	diminishing_flinch_explosion * (1 +  (charge_value*bonus_flinch)),
];

my_charge_current = 0;

