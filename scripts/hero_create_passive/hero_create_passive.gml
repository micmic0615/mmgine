my_passive_list =  ds_create("list");
ds_list_clear(my_passive_list)
ds_list_copy(my_passive_list, global.hero_passive_list);

hero_skill_set_passive();