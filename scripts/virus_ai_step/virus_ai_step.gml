ai_target_attack_should_channel = false;
if (ai_step_attack_else_wander(["health_low_not_full", "ally"])){
	
	
	if (ai_target.status_health_current == ai_target.status_health_max){
		ai_target = noone;
	} else {
		if (distance_between(x,y,ai_target.x, ai_target.y) < my_aura_radius*0.5){
			var random_angle = degtorad(random(360));
			ai_target_move_point = [
				ai_target.x + (cos(random_angle)*my_aura_radius*0.75),
				ai_target.y + (sin(random_angle)*my_aura_radius*0.75),
			]
		}
	}
};

if (!ai_target_attack_should_channel){
	entity_move_point(ai_target_move_point);
};