var me = id;
var check_solid = argument0;
var collision_count = 0;
ds_list_clear(collision_entities)

with(ENTITY){
	if (
		ACTIVE && ALIVE &&
		(
			(me.entity_class == "ACTOR" && me.collision_enabled_actors && collision_enabled_actors) ||
			(me.entity_class == "BULLET" && me.collision_enabled_bullets && collision_enabled_bullets) ||
			(me.entity_class == "DOODAD" && me.collision_enabled_doodads && collision_enabled_doodads) 
		)
	){
		var can_collide = (!check_solid || (check_solid && collision_solid && me.collision_solid)) ? true : false;
		var valid_faction = false;
		
		switch(collision_faction){
			case "all":
				if (me.collision_faction == "all"){
					valid_faction = true
				} else if (me.collision_faction == "ally" && player_faction == me.player_faction){
					valid_faction = true
				} else if (me.collision_faction == "enemy" && player_faction != me.player_faction){
					valid_faction = true
				}
				break
			case "ally":
				if (me.collision_faction == "all" && player_faction == me.player_faction){
					valid_faction = true
				} else if (me.collision_faction == "ally" && player_faction == me.player_faction){
					valid_faction = true
				}
				break
				
			case "enemy":
				if (me.collision_faction == "all" && player_faction != me.player_faction){
					valid_faction = true
				} else if (me.collision_faction == "enemy" && player_faction != me.player_faction){
					valid_faction = true
				}
				break
		}
		
		if (can_collide && valid_faction){
			var not_exception = true;
			if (me.entity_class_lower == "bullet"){
				var is_exception = ds_list_find_index(me.collision_exceptions, id);
				if (is_exception >= 0){not_exception = false}
			}
			
			if (not_exception && place_meeting(x,y,me)){
				collision_count++;			
				ds_list_add(me.collision_entities, id);
			}
		}
	}
}


return collision_count;