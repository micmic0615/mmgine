var you = argument0;
var valid = true;

if (!(you.active && you.alive && you != id)){
	valid = false
}

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

if (valid){
	var is_exception = ds_list_find_index(collision_entities_exceptions, you);
	if (is_exception >= 0){
		valid = false
	}
}



return valid;