var args = argument[0];
var base_target = args[0];
var base_value = args[1];

hero_beatdown_timeslow();

for(var i = 0; i < ds_list_size(my_beatdown_list);i++){
	var p = ds_list_find_value(my_beatdown_list, i);
	entity_run_type_scripts(("beatdown_" + p), args);
}