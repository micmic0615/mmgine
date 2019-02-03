if (action_clone_original == true){
	var me = id;
	for(var i = 0; i < ds_list_size(action_clone_children);i++){
		var p = ds_list_find_value(action_clone_children, i);
		with(p){
			action_chase_cooldown_timer = 0;
			action_chase_trigger(me.action_chase_target)
		}
	};
}