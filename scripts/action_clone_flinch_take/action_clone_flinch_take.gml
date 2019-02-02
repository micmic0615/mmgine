var args = argument[0];
var flinch_source = args[0];
var flinch_value = args[1];
var me = id;

if (actor_clone_original == true){
	if (status_poise_current <= 0){
		var over_flinch = min(abs(status_poise_current)/status_poise_max, 1);
		for(var i = 0; i < ds_list_size(actor_clone_children);i++){
			var p = ds_list_find_value(actor_clone_children, i);
			with(p){actor_buff_apply("flinched", status_flinch_duration*(1 + over_flinch), [], "flinched");}
		};
	}
} else {
	if (entity_enabled(actor_clone_parent)){
		if (actor_clone_parent.status_poise_current > 0){
			actor_flinch_deal([me.actor_clone_parent, flinch_value]);
			//status_poise_current = actor_clone_parent.status_poise_current;
		}
	}
}

return [flinch_source, flinch_value]