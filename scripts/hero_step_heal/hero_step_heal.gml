if (my_heal_cooldown_timer <= 0){
	if (my_heal_active > 0 && actor_actions_id == "heal"){
		if (my_heal_cast_timer <= 0){
			if (my_heal_count > 0){
				my_heal_count--;
				actor_buff_apply("regen_health", my_heal_duration, [((my_heal_percent/100)*status_health_max) / my_heal_duration], "estus_flask");
				entity_sfx_create_pulse(
					/*sprite*/ ExplosionBulletAlt_idle,
					/*duration*/ 0.25*SEC,
					/*blend*/ my_heal_color_2,
					/*style_data*/ [
						140,
						40,
						2
					]
				)
			
				entity_sfx_create_pulse(
					/*sprite*/ ExplosionBulletAlt_idle,
					/*duration*/ 0.25*SEC,
					/*blend*/ my_heal_color_1,
					/*style_data*/ [
						40,
						180,
						2
					]
				)
			} else {
				entity_sfx_create_pulse(
					/*sprite*/ ExplosionBulletAlt_idle,
					/*duration*/ 0.5*SEC,
					/*blend*/ make_color_rgb(160,160,160),
					/*style_data*/ [
						40,
						120,
						2
					]
				)
			}
			
			
			my_heal_cooldown_timer = my_heal_cooldown_value;
			
		}
		
		physics_gravity_current = 0;
		
		actor_actions_id = "heal";
	
		animation_name = "heal"
		animation_angle = 0;
		animation_direction = 1;
	
		my_heal_active -= TIMESPEED;
	} else {
		my_heal_cast_timer = my_heal_cast_value;
	}
} else {
	my_heal_cooldown_timer -= TIMESPEED;
	my_heal_cast_timer = my_heal_cast_value;
}
