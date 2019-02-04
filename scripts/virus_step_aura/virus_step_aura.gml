var me = id;

if (actor_actions_enabled){
	if (entity_room_age_modulo(0.75*SEC)){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 1*SEC,
			/*blend*/ my_aura_color_1,
			/*style_data*/ [
				180,
				my_aura_radius,
				0.25
			]
		);
	
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 1.25*SEC,
			/*blend*/ my_aura_color_2,
			/*style_data*/ [
				60,
				my_aura_radius,
				0.25
			]
		);
	
		with(ACTOR){
			if (entity_enabled()){
				if (id == me){
					actor_buff_apply("regen_health", me.my_aura_duration, [((me.my_aura_heal_percent/50)*status_health_max) /  me.my_aura_duration], "virus_heal");
				} else {
					if (me.player_faction == player_faction && entity_type_lower != me.entity_type_lower && distance_between(x,y,me.x,me.y) < me.my_aura_radius){
						actor_buff_apply("regen_health", me.my_aura_duration, [((me.my_aura_heal_percent/100)*status_health_max) /  me.my_aura_duration], "virus_heal");
					}
				}
			}
		}
	}
}
