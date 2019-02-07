var action_map = argument[0];

var charge_value = my_charge_current < my_charge_min ? 0 : my_charge_current/my_charge_max;

var divider_cast = my_charge_divider_cast - 1;
var divider_channel = my_charge_divider_channel - 1;

action_map[?"cast_value"] = my_shoot_cast_value / (1 + (charge_value * divider_cast));

if (my_frenzy_timer > 0){action_map[?"cast_value"] = ceil(my_shoot_cast_value*my_frenzy_attack_speed_factor)}

//action_dash_cooldown_reset();