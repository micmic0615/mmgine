if (ACTIVE && ALIVE ){
	var movement_result = entity_step_motion();
	collision_count = entity_step_collision(movement_result);
}