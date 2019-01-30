var you = argument0;
var valid = false;

if (entity_enabled(you) && you != id){
	if (ds_list_find_index(you.collision_entities_valid, id) >= 0){
		valid = true;
	} else {
		valid = true;
		
		if (valid){
			var valid_class = false;
			if (entity_class_lower == "actor" && you.collision_enabled_actors){
				valid_class = true
			}

			if (entity_class_lower == "bullet" && you.collision_enabled_bullets){
				valid_class = true
			}
	
			if (entity_class_lower == "doodad" && you.collision_enabled_doodads){
				valid_class = true
			}
	
			if (!valid_class){
				valid = false;
			}
		}

		if (valid){
			var valid_faction = false;
			switch(you.collision_faction){
				case "all":
					if (collision_faction == "all"){
						valid_faction = true
					} else if (collision_faction == "ally" && you.player_faction == player_faction){
						valid_faction = true
					} else if (collision_faction == "enemy" && you.player_faction != player_faction){
						valid_faction = true
					}
					break
				case "ally":
					if (collision_faction == "all" && you.player_faction == player_faction){
						valid_faction = true
					} else if (collision_faction == "ally" && you.player_faction == player_faction){
						valid_faction = true
					}
					break
				
				case "enemy":
					if (collision_faction == "all" && you.player_faction != player_faction){
						valid_faction = true
					} else if (collision_faction == "enemy" && you.player_faction != player_faction){
						valid_faction = true
					}
					break
			}
	
			if (!valid_faction){
				valid = false
			}
		}
	}
}

return valid;