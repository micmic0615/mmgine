var args = argument[0];
var base_target = args[0];
var base_value = args[1];

hero_beatdown_timeslow();

my_rally_limit = min(my_rally_limit + my_rally_limit_regain, status_health_max)

for(var i = 0; i < ds_list_size(my_beatdown_list);i++){
	var p = ds_list_find_value(my_beatdown_list, i);
	entity_run_type_scripts(("beatdown_" + p), args);
}