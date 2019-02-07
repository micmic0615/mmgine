if (my_shoot_id == "melee"){
	action_chase[?"cooldown_timer"] = my_chase_cooldown_value;
	my_dodge_timer = my_dodge_action_disable;
} else {
	my_dodge_timer = max(my_dodge_poke_disable, my_dodge_timer);
	action_dash_trigger([x + random_mirror(50), y + random_mirror(50)])
}

my_shoot_switch = "free";