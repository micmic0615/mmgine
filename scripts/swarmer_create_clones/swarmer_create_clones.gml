my_clone_original = true;
my_clone_parent = id;
my_clone_children = ds_create("list");
my_clone_family = ds_create("list");
my_clone_count = 2;
my_clone_active = false;
my_clone_spread_distance_min = 80;
my_clone_spread_distance_max = 0
my_clone_spread_cooldown_timer = 0;
my_clone_spread_cooldown_value = 0.5*SEC;

ds_list_add(my_clone_family, id);