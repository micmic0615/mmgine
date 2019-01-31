var target = argument0;
var is_chasing = false;

if (my_chase_cooldown_timer <= 0){
	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ 0.5*SEC,
		/*blend*/ my_chase_color,
		/*style_data*/ [
			30,
			240,
			2
		]
	);
	
	
	
	my_chase_target = target;
	my_chase_active_timer = my_chase_active_value;
	my_chase_cooldown_timer = my_chase_cooldown_value;
	is_chasing = true;
}

return is_chasing