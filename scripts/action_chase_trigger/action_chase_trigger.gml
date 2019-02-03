var target = argument0;
var is_chasing = false;

if (actor_actions_enabled && action_chase_cooldown_timer <= 0){
	action_chase_target = target;
	action_chase_active_timer = action_chase_active_value;
	action_chase_cooldown_timer = action_chase_cooldown_value;
	entity_run_type_scripts("action_chase_cast", action_chase_target);
	is_chasing = true;
}

return is_chasing