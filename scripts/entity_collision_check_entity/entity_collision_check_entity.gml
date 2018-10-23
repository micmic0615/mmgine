var me = id;
var check_solid = argument0;
var collision_count = 0;
ds_list_clear(collision_entities)

with(ENTITY){
	if (
		ACTIVE &&
		(
			(me.entity_class == "ACTOR" && me.collision_enabled_actors && collision_enabled_actors) ||
			(me.entity_class == "BULLET" && me.collision_enabled_bullets && collision_enabled_bullets) ||
			(me.entity_class == "DOODAD" && me.collision_enabled_doodads && collision_enabled_doodads) 
		)
	){
		var can_collide = (!check_solid || (check_solid && collision_solid && me.collision_solid)) ? true : false;
		
		//var x_clipper = sprite_width + me.sprite_width;
		//var y_clipper = sprite_height + me.sprite_height;
		
		//if (can_collide && !(x > me.x - x_clipper && x < me.x + x_clipper && y > me.y - y_clipper && y < me.y + y_clipper)){
		//	can_collide = false
		//}
		
		if (can_collide && place_meeting(x,y,me)){
			collision_count++;			
			ds_list_add(me.collision_entities, id);
		}
	}
}


return collision_count;