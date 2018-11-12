var target = argument0;
if (target.entity_class_lower == "actor"){
	entity_sfx_create(
		ExplosionBulletAlt_idle,
		0.075*SEC,
		0,
		0,
		make_color_rgb(255,0,255),
		0,
		1,
		1,
		id,
		"expand",
		[
			30,
			160
		]
	)
		
	my_attack_super_duration += 2*SEC;
	my_attack_super_target_angle = undefined;
} else if (target.entity_class_lower == "bullet"){
	my_attack_super_duration += target.status_health_max > 1 ? 0.5*SEC : 0;
	my_attack_super_target_angle = undefined;
}
