var you = argument0;
if (entity_collision_validate(you)){ 
	ds_list_add(collision_entities_valid, you)
	if (place_meeting(x,y,you)){
		ds_list_add(collision_entities_connect, you)
	}
}