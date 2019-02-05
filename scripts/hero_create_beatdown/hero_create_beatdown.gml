my_beatdown_list =  ds_create("list");
my_beatdown_cooldown_value = 5*SEC;
my_beatdown_cooldown_timer = 0;
ds_list_clear(my_beatdown_list)
ds_list_copy(my_beatdown_list, global.hero_beatdown_list);