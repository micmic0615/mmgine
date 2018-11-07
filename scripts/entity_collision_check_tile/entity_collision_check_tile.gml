var me = id;
var check_solid = argument0;
var collision_count = 0;
ds_list_clear(collision_tiles)

if (me.collision_enabled_tiles){
	with(TILE){
		if ( ACTIVE && ALIVE ){
			var can_collide = (!check_solid || (check_solid && me.collision_solid_tiles)) ? true : false;
		
			if (can_collide && place_meeting(x,y,me)){
				collision_count++;			
				ds_list_add(me.collision_tiles, id);
			}
		}
	}
}

return collision_count;