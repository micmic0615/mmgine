var args = argument[0];
var flinch_source = args[0];
var flinch_value = args[1];
var me = id;

flinch_value = flinch_value/my_clone_count;
if (my_clone_original == true){
	if (status_poise_current <= 0){
		var over_flinch = min(abs(status_poise_current)/status_poise_max, 1);
		for(var i = 0; i < ds_list_size(my_clone_children);i++){
			var p = ds_list_find_value(my_clone_children, i);
			with(p){actor_buff_apply("flinched", status_flinch_duration*(1 + over_flinch), [], "flinched");}
		};
	}
} else {
	if (entity_enabled(my_clone_parent)){
		if (my_clone_parent.status_poise_current > 0){
			with(flinch_source){actor_flinch_deal([me.my_clone_parent, flinch_value])}
			status_poise_current = my_clone_parent.status_poise_current;
		}
	} 
}