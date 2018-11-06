var args = argument0;
if (seekingbullet_hit_take_cooldown_timer <= 0){
	seekingbullet_hit_take_current -= 1;
	seekingbullet_hit_take_cooldown_timer = seekingbullet_hit_take_cooldown_value;
	
	status_movespeed_base *= 1.15;
	bullet_seek_turn_rate *= 1.1;
	
	if (seekingbullet_hit_take_current == 0){
		bullet_lifespan = 0;
	}
}
return args;