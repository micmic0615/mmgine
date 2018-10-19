ds_inventory = ds_list_create();

physics_motion_list = ds_create("list");
physics_motion_x = 0;
physics_motion_y = 0;
physics_motion_spill_x = 0;
physics_motion_spill_y = 0;

entity_class = object_get_name(object_get_parent(object_index));
entity_type = object_get_name(object_index);



entity_run_scripts("create");