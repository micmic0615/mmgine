

if (my_chase_active_timer > 0){
	my_chase_active_timer -= TIMESPEED;
	if (entity_enabled(my_chase_target)){
		if (entity_room_age_modulo(0.1*SEC)){
			actor_buff_apply("speed_bonus_percent", 0.15*SEC, [my_chase_movespeed_bonus], "wasp_chase_movespeed");
			actor_buff_apply("movesnap_set_raw", 0.15*SEC, [my_chase_movesnap_set], "wasp_chase_movesnap");
			entity_mirage_create(0.25*SEC, 0, 0, my_chase_color, 0.5);
		}
		
		animation_name = "dash";
		entity_move_point([my_chase_target.x, my_chase_target.y])
		
		if (distance_between(x,y,my_chase_target.x,my_chase_target.y) < 120){
			my_chase_active_timer = 0;
			
			entity_sfx_create_pulse(
				/*sprite*/ ExplosionBulletAlt_idle,
				/*duration*/ 0.5*SEC,
				/*blend*/ my_chase_color,
				/*style_data*/ [
					30,
					320,
					2
				]
			);
		}
	} else {
		my_chase_active_timer = 0;
	}
	
} else {
	
	if (my_chase_cooldown_timer > 0){
		my_chase_cooldown_timer -= TIMESPEED;
	} else {
		my_chase_cooldown_timer = my_chase_cooldown_value;
	}
}



