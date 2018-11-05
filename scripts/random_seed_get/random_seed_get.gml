var random_multiplier = argument0;
var random_number = ds_list_find_value(global.random_seed, global.random_index)
global.random_index = global.random_index+1;
random_seed_populate();
return random_multiplier*random_number
