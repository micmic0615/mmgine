if (my_shoot_id == "melee"){
	var action_map = argument[0];
	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ my_shoot_cast_value,
		/*blend*/ my_shoot_color,
		/*style_data*/ [
			my_shoot_bullet_range,
			40,
			2
		]
	);

	action_chase[?"success"] = false;
	my_dodge_timer = my_shoot_cast_value;

	var target_point = action_map[?"target_point"];
	var back_angle = angle_between(x,y,target_point[0],target_point[1]);
	entity_motion_push(180, my_shoot_cast_value, back_angle, ["multiply",1.1]);
} else {
	my_dodge_timer = max(my_dodge_poke_disable,my_dodge_timer);
}
