var move_point = [round(argument0[0]), round(argument0[1])];

if (my_clone_original && my_clone_active){
	for(var i = 0; i < ds_list_size(my_clone_children);i++){
		var p = ds_list_find_value(my_clone_children, i);
		
		if (entity_enabled(p)){
			with(p){entity_move_point(move_point)};
		}
	};
}

return move_point;