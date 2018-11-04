var me = argument0;
var check_solid = argument1;
var can_collide = false;
var valid_faction = false;

if (
	ACTIVE && ALIVE &&
	(
		(me.entity_class == "ACTOR" && me.collision_enabled_actors && collision_enabled_actors) ||
		(me.entity_class == "BULLET" && me.collision_enabled_bullets && collision_enabled_bullets) ||
		(me.entity_class == "DOODAD" && me.collision_enabled_doodads && collision_enabled_doodads) 
	)
){
	can_collide = (!check_solid || (check_solid && collision_solid_entities && me.collision_solid_entities)) ? true : false;
		
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
}

return (can_collide && valid_faction)