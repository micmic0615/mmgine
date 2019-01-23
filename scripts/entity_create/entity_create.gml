ALIVE = true;
ACTIVE = true;
ROOM = instance_find(ROOM_OBJECT, 0);

depth = 50;
ds_inventory = ds_list_create();

physics_time_local = 1;

physics_motion_list = ds_create("list");
physics_motion_x = 0;
physics_motion_y = 0;
physics_motion_angle = 0;
physics_motion_spill_x = 0;
physics_motion_spill_y = 0;

physics_gravity_on = false;
physics_gravity_angle = GRAVITY_ANGLE;
physics_gravity_force = GRAVITY_FORCE;
physics_gravity_max = GRAVITY_MAX;
physics_gravity_current = 0;
physics_gravity_turnrate = 45*PPS;
physics_gravity_falling = 0;
physics_gravity_factor = 1;

entity_age = 0

entity_class = object_get_name(object_get_parent(object_index));
entity_class_lower = string_lower(entity_class);

entity_type = object_get_name(object_index);
entity_type_lower = string_lower(entity_type);

entity_killer = noone;

collision_entities_valid = ds_create("list");
collision_entities_connect = ds_create("list");
collision_entities_exceptions = ds_create("list");
collision_count = [0,0]
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

collision_destroy_enabled = false;
collision_destroy_value_current = 1;
collision_destroy_value_max = 1;


status_health_max = 1;
status_movespeed_base = 100*PPS;
status_movesnap_base = 0.5*SEC;
status_move_angle_list = ds_create("list");
status_immortal = false;

camera_inside_view = false;

player_faction = -1;

animation_sprite = entity_type;
animation_name = "idle";
animation_direction = 1;
animation_angle = 0;
animation_rotatable = true;

draw_particle_emitter = part_emitter_create(global.particle_system);
draw_particle_list = ds_create("list")

entity_run_class_scripts("create");

status_health_current = status_health_max;
status_movesnap_total = status_movesnap_base;
status_movespeed_total = status_movespeed_base;

draw_blend_temporary_color = c_white;
draw_blend_temporary_style = "solid";
draw_blend_temporary_duration = 0;

