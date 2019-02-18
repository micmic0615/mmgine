with(ENTITY){
	if (entity_enabled() && !collision_entities_valid_is_computed){
		ds_list_clear(collision_entities_valid);
		entity_collision_validate_set();
						
		for (var i = 0; i < ds_list_size(collision_entities_valid); ++i) {
			var p = ds_list_find_value(collision_entities_valid, i)
			if (ds_list_find_index(p.collision_entities_valid, id) <= -1){
				ds_list_add(p.collision_entities_valid, id)
			}
		}
						
		collision_entities_valid_is_computed = true
	}
}