var action_map = argument[0];

var charge_value = my_charge_meter/my_charge_max;
if (charge_value < 0.75){charge_value = 0}

var bonus_size = my_charge_factor_size - 1;
var bonus_speed = my_charge_factor_speed - 1;
var bonus_range = my_charge_factor_range - 1;
var bonus_explosion = my_charge_factor_explosion - 1;

var bonus_damage = my_charge_factor_damage - 1;
var bonus_flinch = my_charge_factor_flinch - 1;

action_map[?"bullet_radius"] = my_shoot_bullet_radius * (1 + (charge_value*bonus_size));
action_map[?"bullet_range"] = my_shoot_bullet_range * (1 + (charge_value*bonus_range))
action_map[?"bullet_speed"] = my_shoot_bullet_speed * (1 + (charge_value*bonus_speed));
action_map[?"bullet_explosion_radius"] = my_shoot_bullet_explosion_radius * (1 + (charge_value*bonus_explosion));

if (my_frenzy_timer > 0){
	action_map[?"bullet_speed"] *= 1.25
}

action_map[?"damage"] = [
	my_shoot_damage[0] * (1 +  (charge_value*bonus_damage)),
	my_shoot_damage[1] * (1 +  (charge_value*bonus_damage)),
];

action_map[?"flinch"] = [
	my_shoot_flinch[0] * (1 +  (charge_value*bonus_flinch)),
	my_shoot_flinch[1] * (1 +  (charge_value*bonus_flinch)),
];

action_map[?"fire_recoil"] = my_shoot_fire_recoil * (1 +  (charge_value*bonus_damage));

