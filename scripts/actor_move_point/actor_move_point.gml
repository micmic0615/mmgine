var move_point = [round(argument0[0]), round(argument0[1])];
var move_point = entity_run_type_scripts("move_point", move_point);
physics_gravity_current = max(physics_gravity_current - (physics_gravity_force*1.25), 0);
return move_point;