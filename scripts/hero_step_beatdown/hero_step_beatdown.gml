if (my_beatdown_cooldown_timer > 0){
	my_beatdown_cooldown_timer -= 1;
}

var me = id;
with(BULLET){
	if(entity_enabled() && bullet_spawn_group == "hero_breach_summon"){
		if (breach_dash_cooldown_timer > 0){
			breach_dash_cooldown_timer -= TIMESPEED
		} else {		
			bullet_action_move_angle = random(360);
			entity_motion_push(50, 0.25*SEC, bullet_action_move_angle, ["multiply",1.25], "bullet_push");
			breach_dash_cooldown_timer = breach_dash_cooldown_value
		}
	}
}