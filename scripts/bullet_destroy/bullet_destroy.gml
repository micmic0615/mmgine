if (instance_exists(id)){
	if (ds_exists(bullet_death_spawn, ds_type_map) && ds_map_exists(bullet_death_spawn, "type") && bullet_death_spawn[?"type"] != noone){
		var can_spawn = false;
	
		switch(bullet_death_spawn_trigger){
			case "death": can_spawn = status_health_current == 0 ? true : false; break
			case "expire": can_spawn = status_health_current == 0 ? false : true; break
			case "always": 
			default: can_spawn = true; break;
			
		}
	
		if (can_spawn){
			var spawn_x = bullet_death_spawn[?"x"] != undefined ? x + bullet_death_spawn[?"x"] : x;
			var spawn_y = bullet_death_spawn[?"y"] != undefined ? y + bullet_death_spawn[?"y"] : y;
			var bullet = instance_create_depth(spawn_x, spawn_y, depth, bullet_death_spawn[?"type"]);
			bullet.bullet_origin = bullet_origin;
	
			var current_key = ds_map_find_first(bullet_death_spawn);
			if (current_key != undefined && current_key != "type" && current_key != "x" && current_key != "y" ){
				if (current_key != "bullet_collision_entity_actions"){
					variable_instance_set(bullet, current_key, ds_map_find_value(bullet_death_spawn, current_key))
				} else {
					var action_index = 0;
					var action_count = array_length_1d(bullet_death_spawn[?"bullet_collision_entity_actions"]);
				
					while(action_index < action_count){
						var current_action = bullet_death_spawn[?"bullet_collision_entity_actions"];
						ds_list_add(bullet.bullet_collision_entity_actions, current_action[action_index]);
						action_index++;
					}
				}
			}
	
			while(current_key != undefined){
				current_key = ds_map_find_next(bullet_death_spawn, current_key);
				if (current_key != undefined && current_key != "type" && current_key != "x" && current_key != "y" ){
					if (current_key != "bullet_collision_entity_actions"){
						variable_instance_set(bullet, current_key, ds_map_find_value(bullet_death_spawn, current_key))
					} else {
						var action_index = 0;
						var action_count = array_length_1d(bullet_death_spawn[?"bullet_collision_entity_actions"]);
			
						while(action_index < action_count){
							var current_action = bullet_death_spawn[?"bullet_collision_entity_actions"];
							ds_list_add(bullet.bullet_collision_entity_actions, current_action[action_index]);
							action_index++;
						}
					}
				}
			}
		
			for(var i = 0; i < ds_list_size(collision_entities_exceptions);i++){
				var p = ds_list_find_value(collision_entities_exceptions, i);
				ds_list_add(bullet.collision_entities_exceptions, p);
			}
		}
	}
	
	entity_run_type_scripts("destroy");
	if (status_health_current > 0 && ds_map_exists(bullet_death_spawn, "type")){
		entity_mirage_create(0.4*SEC, 0, 0, make_color_rgb(255,255,255));
	}
}





