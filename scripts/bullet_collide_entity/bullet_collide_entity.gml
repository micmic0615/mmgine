if (ACTIVE && ALIVE){
	for(var i = 0; i < ds_list_size(collision_entities_connect);i++){
		var p = ds_list_find_value(collision_entities_connect, i);
		
		var can_pop = true;
		if (p.entity_class_lower == "actor" && p.status_iframe == true){can_pop = false}
		
		if (can_pop){
			ds_list_add(collision_entities_exceptions, p);
			
			if (collision_destroy_enabled){
				collision_destroy_value_current -= p.collision_destroy_value_max;
			}
		
			if (p.collision_destroy_enabled){
				p.collision_destroy_value_current -= collision_destroy_value_max;
			}
		}
	}
	
	for(var i = 0; i < ds_list_size(bullet_collision_entity_actions);i++){
		var p = ds_list_find_value(bullet_collision_entity_actions, i);
		var type = p[0];
		var target_class = p[1];
	
		switch(type){
			case "damage": bullet_collision_damage(p); break;
			case "flinch": bullet_collision_flinch(p); break;
			case "push": bullet_collision_push(p); break;
		}
	}

	entity_run_type_scripts("collide_entity");
}