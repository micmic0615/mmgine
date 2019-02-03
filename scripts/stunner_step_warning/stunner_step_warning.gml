if (action_shoot_cooldown_timer <= (0.5*SEC) && actor_actions_enabled){
	if (actor_actions_id == "shoot" && action_shoot_cast_timer > 0){
		if (entity_room_age_modulo(0.2*SEC)){
			entity_sfx_create_pulse(
				/*sprite*/ ExplosionBulletAlt_idle,
				/*duration*/ 0.4*SEC,
				/*blend*/ my_shoot_flair_color,
				/*style_data*/ [
					my_vacuum_range,
					40,
					1
				]
			);
		}
	} else {
		if (entity_room_age_modulo(0.7*SEC)){	
			entity_sfx_create_pulse(
				/*sprite*/ ExplosionBulletAlt_idle,
				/*duration*/ 1.4*SEC,
				/*blend*/ my_shoot_flair_color,
				/*style_data*/ [
					40,
					enemy_attack_range_total,
					0.5
				]
			);
		}
	}
} else {
	if (entity_room_age_modulo(1*SEC)){	
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 2*SEC,
			/*blend*/ make_color_rgb(160,160,160),
			/*style_data*/ [
				40,
				enemy_attack_range_total,
				0.25
			]
		);
	}
}
