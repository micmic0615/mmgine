if (entity_enabled()){
	collision_base_movement = entity_step_motion();
	collision_count = entity_step_collision(collision_base_movement);
}

