var charge_value = my_charge_current < my_charge_min ? 0 : my_charge_current/my_charge_max;

var divider_cast = my_charge_divider_cast - 1;
var divider_channel = my_charge_divider_channel - 1;

action_shoot_cast_value = my_shoot_cast_value / (1 + (charge_value * divider_cast));
action_shoot_channel_value = my_shoot_channel_value / (1 + (charge_value * divider_channel));