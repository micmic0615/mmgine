ALIVE = true;
ACTIVE = false;
depth = 50;
ds_inventory = ds_list_create();

physics_motion_list = ds_create("list");
physics_motion_x = 0;
physics_motion_y = 0;
physics_motion_spill_x = 0;
physics_motion_spill_y = 0;

entity_class = object_get_name(object_get_parent(object_index));
entity_class_lower = string_lower(entity_class);

entity_type = object_get_name(object_index);
entity_type_lower = string_lower(entity_type);

entity_killer = noone;

collision_entities = ds_create("list");
collision_exceptions = ds_create("list");
collision_tiles = ds_create("list");
collision_contact_x = "none";
collision_contact_y = "none";
collision_compute = true;
collision_persistent = false;
collision_solid_tiles = true;
collision_solid_entities = true;
collision_pushable = true;
collision_enabled_actors = true;
collision_enabled_bullets = true;
collision_enabled_doodads = true;
collision_enabled_tiles = true;
collision_faction = "all";

status_health_max = 1;
status_movespeed_base = 100*PPS;
status_movesnap_base = 0.5*SEC;
status_move_angle_list = ds_create("list");

player_faction = -1;

animation_name = "idle";
animation_direction = 1;
animation_angle = 0;

entity_run_class_scripts("create");

status_health_current = status_health_max;
status_movesnap_total = status_movesnap_base;
status_movespeed_total = status_movespeed_base;