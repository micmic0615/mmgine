player_faction = 0;

collision_faction = "enemy";


status_movespeed_base = 800*PPS;
status_movesnap_base = 0.25*SEC;

bullet_action_move_angle = 0;
bullet_lifespan = 0.5*SEC;
bullet_origin = noone;
bullet_collision_actions = ds_create("list");


entity_run_type_scripts("create");