var args = argument[0];
var flinch_source = args[0];
var flinch_value = args[1];
var me = id;

if (action_clone_original == true){
	if (status_poise_current <= 0){
		var over_flinch = min(abs(status_poise_current)/status_poise_max, 1);
		for(var i = 0; i < ds_list_size(action_clone_children);i++){
			var p = ds_list_find_value(action_clone_children, i);
			with(p){actor_buff_apply("flinched", status_flinch_duration*(1 + over_flinch), [], "flinched");}
		};
	}
} else {
	if (entity_enabled(action_clone_parent)){
		if (action_clone_parent.status_poise_current > 0){
			var parent = me.action_clone_parent;
			var flinch_base = (flinch_value/(1 - (parent.status_armor_poise/100)))
			actor_flinch_deal([me.action_clone_parent, flinch_base]);
			//if (status_poise_current <= 0){status_poise_current = 1};
		}
	}
}

return [flinch_source, flinch_value]