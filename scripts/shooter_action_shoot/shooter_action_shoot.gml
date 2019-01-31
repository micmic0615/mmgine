var charge_value = my_charge_meter/my_charge_max;
if (charge_value < 0.5){charge_value = 0}

var bonus_size = my_charge_factor_size - 1;
var bonus_speed = my_charge_factor_speed - 1;
var bonus_range = my_charge_factor_range - 1;
var bonus_explosion = my_charge_factor_explosion - 1;

var bonus_damage = my_charge_factor_damage - 1;
var bonus_flinch = my_charge_factor_flinch - 1;

action_shoot_bullet_radius = my_shoot_bullet_radius * (1 + (charge_value*bonus_size));
action_shoot_bullet_range = my_shoot_bullet_range * (1 + (charge_value*bonus_range))
action_shoot_bullet_speed = my_shoot_bullet_speed * (1 + (charge_value*bonus_speed));
action_shoot_bullet_explosion = my_shoot_bullet_explosion * (1 + (charge_value*bonus_explosion));

action_shoot_damage = [
	my_shoot_damage[0] * (1 +  (charge_value*bonus_damage)),
	my_shoot_damage[1] * (1 +  (charge_value*bonus_damage)),
];

action_shoot_flinch = [
	my_shoot_flinch[0] * (1 +  (charge_value*bonus_flinch)),
	my_shoot_flinch[1] * (1 +  (charge_value*bonus_flinch)),
];

action_shoot_recoil_range = my_shoot_recoil_range * (1 +  (charge_value*bonus_damage));

my_charge_meter = 0;

