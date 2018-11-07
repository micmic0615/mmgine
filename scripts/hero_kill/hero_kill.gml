var target = argument0;
if (target.entity_class_lower == "actor"){
	my_attack_super_duration += 1.5*SEC;
	my_attack_super_target_angle = undefined;
} else if (target.entity_class_lower == "bullet"){
	my_attack_super_duration += target.status_health_max > 1 ? 0.5*SEC : 0;
	my_attack_super_target_angle = undefined;
}
