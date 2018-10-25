if (bullet_lifespan > 0){
	entity_run_type_scripts("step");

	if (status_movesnap_total > 0){
		entity_move_angle(bullet_action_move_angle)
	}
	
	bullet_lifespan = bullet_lifespan == INFINITY ? bullet_lifespan : (bullet_lifespan - 1);
} else {
	entity_kill(id);
}
