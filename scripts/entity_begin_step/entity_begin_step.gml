if (entity_enabled()){
	if (collision_compute && ROOM.room_age_real % collision_modulo == collision_index){
		ds_list_clear(collision_entities_connect)
	}
}