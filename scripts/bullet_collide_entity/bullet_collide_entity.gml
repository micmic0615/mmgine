if (ACTIVE && ALIVE){
	for(var i = 0; i < ds_list_size(collision_entities);i++){
		var p = ds_list_find_value(collision_entities, i);
		ds_list_add(collision_exceptions, p);
	}
	
	for(var i = 0; i < ds_list_size(bullet_collision_entity_actions);i++){
		var p = ds_list_find_value(bullet_collision_entity_actions, i);
		var type = p[0];
		var target_class = p[1];
	
		switch(type){
			case "damage": bullet_collision_damage(p); break;
			case "flinch": bullet_collision_flinch(p); break;
			case "push": bullet_collision_push(p); break;
			
			case "self_damage": 
				var trigger = false;
				for(var i2 = 0; i2 < ds_list_size(collision_entities);i2++){
					if (trigger == false && ds_list_find_value(collision_entities, i2).entity_class_lower == target_class){trigger = true}
				};
				
				if (trigger){entity_damage_deal([id, p[2], true])}
				break;
		}
	}

	entity_run_type_scripts("collide_entity");
}