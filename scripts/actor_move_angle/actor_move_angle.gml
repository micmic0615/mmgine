var move_angle = argument0;
var action_angle = actor_action_module_run("move_angle", move_angle);
if (action_angle != undefined){move_angle = action_angle}
var actor_angle = entity_run_type_scripts("move_angle", move_angle);
if (actor_angle != undefined){move_angle = actor_angle}
physics_gravity_current = max(physics_gravity_current - (physics_gravity_force*1.25), 0);
return move_angle;