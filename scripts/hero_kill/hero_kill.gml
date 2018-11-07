var target = argument0;
if (target.entity_class_lower == "actor"){
	my_attack_super_duration += 1.2*SEC;
	my_attack_super_target_angle = undefined;
	my_attack_super_spawn_x = target.x;
	my_attack_super_spawn_y = target.y;
} else if (target.entity_class_lower == "bullet"){
	my_attack_super_duration += 0.4*SEC;
	my_attack_super_target_angle = undefined;
}
