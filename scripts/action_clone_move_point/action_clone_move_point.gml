var move_point = argument0;

if (action_clone_original && action_clone_active){
	for(var i = 0; i < ds_list_size(action_clone_children);i++){
		var p = ds_list_find_value(action_clone_children, i);
		
		if (entity_enabled(p)){
			with(p){entity_move_point(move_point)};
		}
	};
}

return move_point;