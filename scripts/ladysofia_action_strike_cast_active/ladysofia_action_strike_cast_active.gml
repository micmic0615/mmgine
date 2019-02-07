var action_map = argument[0];
	
if (action_map[?"cast_timer"] < action_map[?"cast_aim_limit"]){
	if (entity_room_age_modulo(0.1*SEC)){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 0.5*SEC,
			/*blend*/ my_strike_color,
			/*style_data*/ [
				120,
				40,
				0.75
			]
		);
	}
}
