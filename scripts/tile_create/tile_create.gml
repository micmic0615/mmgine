ALIVE = true;
ACTIVE = false;
depth = 55;
ds_inventory = ds_list_create();

tile_type = object_get_name(object_index);
tile_type_lower = string_lower(tile_type);
tile_original = false;
tile_initiate = true;

tile_clones = ds_create("list");

camera_inside_view = false;

tile_run_scripts("create")

