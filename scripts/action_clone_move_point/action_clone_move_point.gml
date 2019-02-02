var move_point = argument0;

if (actor_clone_original && actor_clone_active){
	for(var i = 0; i < ds_list_size(actor_clone_children);i++){
		var p = ds_list_find_value(actor_clone_children, i);
		
		if (entity_enabled(p)){
			with(p){entity_move_point(move_point)};
		}
	};
}

return move_point;