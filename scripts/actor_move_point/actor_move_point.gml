var move_point = [round(argument0[0]), round(argument0[1])];
var action_point = actor_action_module_run("move_point", move_point);
if (action_point != undefined){move_point = action_point}
var actor_point = entity_run_type_scripts("move_point", move_point);
if (actor_point != undefined){move_point = actor_point}
physics_gravity_current = max(physics_gravity_current - (physics_gravity_force*1.25), 0);
return move_point;