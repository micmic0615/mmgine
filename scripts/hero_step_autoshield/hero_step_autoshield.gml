if (my_autoshield_cooldown_timer > 0){
	my_autoshield_cooldown_timer -= TIMESPEED;
}

if (my_grit_cooldown_timer > 0){
	my_grit_cooldown_timer -= TIMESPEED;
}

if (my_autoshield_active_timer > 0){
	my_autoshield_active_timer -= TIMESPEED
} else {
	my_autoshield_active_bank = 0;
}