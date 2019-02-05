ALIVE = false;
ACTIVE = false;
entity_run_class_scripts("destroy");

if (ds_exists(collision_entities_valid, ds_type_list)){
	for (var i = 0; i < ds_list_size(collision_entities_valid); ++i) {
		var p = ds_list_find_value(collision_entities_valid, i);
		var valid_index = ds_list_find_index(p.collision_entities_valid, id);
		if (valid_index > -1){ds_list_delete(p.collision_entities_valid, valid_index)}
	}
}

ds_clear();
part_emitter_destroy(global.particle_system, draw_particle_emitter);
