var charge_value = my_charge_current < my_charge_min ? 0 : my_charge_current/my_charge_max;
action_shoot_bullet_radius = my_shoot_bullet_radius * (1 +  (charge_value*my_charge_bonus_factor_size));
action_shoot_bullet_speed = my_shoot_bullet_speed * (1 +  (charge_value*my_charge_bonus_factor_speed));
action_shoot_bullet_explosion = my_shoot_bullet_explosion * (1 +  (charge_value*my_charge_bonus_factor_size));
my_charge_current = 0;

if (charge_value < 1){
	status_poise_current = max(1, status_poise_current*my_shoot_poise_cost);
}