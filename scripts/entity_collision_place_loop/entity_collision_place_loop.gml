if (ROOM.room_age_real % collision_modulo == collision_index){
	for (i = 0; i < ds_list_size(collision_entities_valid); i += 1){
		var p = ds_list_find_value(collision_entities_valid, i)
		entity_collision_place_instance(p);
	}
}
