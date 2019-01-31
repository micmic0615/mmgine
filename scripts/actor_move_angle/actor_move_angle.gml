var move_angle = argument0;
var angle = entity_run_type_scripts("move_angle", move_angle);
physics_gravity_current = max(physics_gravity_current - (physics_gravity_force*1.25), 0);
return angle;