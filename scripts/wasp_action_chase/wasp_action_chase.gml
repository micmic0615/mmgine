var target = argument0;
var is_chasing = false;

if (my_chase_cooldown_timer <= 0){
	my_chase_target = target;
	my_chase_active_timer = my_chase_active_value;
	my_chase_cooldown_timer = my_chase_cooldown_value;
	is_chasing = true;
}

return is_chasing