var angle = argument0;
physics_gravity_current = max(physics_gravity_current - (physics_gravity_force*1.25), 0);
action_shoot_backswing_timer = 0;
my_charge_accelerate_delay_timer = max(my_charge_accelerate_delay_value, my_charge_accelerate_delay_timer);
return angle;