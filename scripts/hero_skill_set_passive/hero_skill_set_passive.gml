hero_create_stats();

for(var i = 0; i < ds_list_size(my_passive_list);i++){
	var p = ds_list_find_value(my_passive_list, i);
	entity_run_type_scripts(("passive_" + p));
}