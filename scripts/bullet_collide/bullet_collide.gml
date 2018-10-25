if (ACTIVE && ALIVE){
	for(var i = 0; i < ds_list_size(collision_entities);i++){
		var p = ds_list_find_value(collision_entities, i);
		ds_list_add(collision_exceptions, p);
	}
	
	for(var i = 0; i < ds_list_size(bullet_collision_actions);i++){
		var p = ds_list_find_value(bullet_collision_actions, i);
		var type = p[0];
	
		switch(type){
			case "damage": bullet_collision_damage(p); break;
			case "flinch": bullet_collision_flinch(p); break;
			case "push": bullet_collision_push(p); break;
		}
	}

	entity_run_type_scripts("collide");
}