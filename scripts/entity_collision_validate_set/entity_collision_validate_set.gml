
if (entity_enabled()){
	if (collision_enabled_actors){
		var i, p = array_create(instance_number(ACTOR));
		for (i = 0; i < instance_number(ACTOR); i += 1){
			p[i] = instance_find(ACTOR,i)
			if (entity_collision_validate_attributes(p[i])){
				ds_list_add(collision_entities_valid, p[i]);
			}
		}
	}

	if (collision_enabled_bullets){
		var i, p = array_create(instance_number(BULLET));
		for (i = 0; i < instance_number(BULLET); i += 1){
			p[i] = instance_find(BULLET,i)
			if (entity_collision_validate_attributes(p[i])){
				ds_list_add(collision_entities_valid, p[i]);
			}
		} 
	}
	
	if (collision_enabled_doodads){
		var i, p = array_create(instance_number(DOODAD));
		for (i = 0; i < instance_number(DOODAD); i += 1){
			p[i] = instance_find(DOODAD,i)
			if (entity_collision_validate_attributes(p[i])){
				ds_list_add(collision_entities_valid, p[i]);
			}
		} 
	}
}
