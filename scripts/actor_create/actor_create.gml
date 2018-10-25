status_base_movespeed = 100*PPS;
status_base_movesnap = 0.5*SEC;

actor_move_angle_list = ds_create("list");

player_faction = 0;

entity_run_type_scripts("create");

status_total_movesnap = status_base_movesnap;
status_total_movespeed = status_base_movespeed;
