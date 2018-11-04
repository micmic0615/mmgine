var me = id;
var check_solid = argument0;
var collision_count = 0;
ds_list_clear(collision_entities)

with(ENTITY){
	if (entity_collision_validate_entity(me, check_solid)){
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

return collision_count;