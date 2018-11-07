player_faction = 0;

collision_faction = "enemy";
collision_solid_entities = false;

status_health_max = 1;
status_movespeed_base = 800*PPS;
status_movesnap_base = 0.25*SEC;

bullet_action_move_angle = 0;
bullet_lifespan = 1*SEC;
bullet_origin = noone;
bullet_collision_entity_actions = ds_create("list");
bullet_collision_tile_action = "bounce";

bullet_seek_range = 0;
bullet_seek_target = noone;
bullet_seek_turn_rate = 0;
bullet_seek_angle_limit = 60;


bullet_death_spawn = ds_create("map");
bullet_death_spawn_trigger = "death"

entity_run_type_scripts("create");