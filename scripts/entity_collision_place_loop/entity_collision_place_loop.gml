if (ROOM.room_age_real % collision_modulo == collision_index){
	if (collision_enabled_actors){
		var i, p = array_create(instance_number(ACTOR));
		for (i = 0; i < instance_number(ACTOR); i += 1){
			entity_collision_place_instance(instance_find(ACTOR,i));
		}
	}

	if (collision_enabled_bullets){
		var i, p = array_create(instance_number(BULLET));
		for (i = 0; i < instance_number(BULLET); i += 1){
			entity_collision_place_instance(instance_find(BULLET,i));
		} 
	}
	
	if (collision_enabled_doodads){
		var i, p = array_create(instance_number(DOODAD));
		for (i = 0; i < instance_number(DOODAD); i += 1){
			entity_collision_place_instance(instance_find(DOODAD,i));
		} 
	}
}
