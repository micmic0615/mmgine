ds_inventory = ds_list_create();

physics_motion_list = ds_create("list");


entity_class = object_get_name(object_get_parent(object_index));
entity_type = object_get_name(object_index);

entity_run_scripts("create");