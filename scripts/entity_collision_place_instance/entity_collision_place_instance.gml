var you = argument0;
if (
	entity_enabled(you) &&
	ds_list_find_index(collision_entities_exceptions, you) < 0 &&
	ds_list_find_index(you.collision_entities_exceptions, id) < 0
){
	if (ds_list_find_index(you.collision_entities_connect, id) >= 0){
		ds_list_add(collision_entities_connect, you);
	} else if (place_meeting(x,y,you)){
		ds_list_add(collision_entities_connect, you)
	}
}

