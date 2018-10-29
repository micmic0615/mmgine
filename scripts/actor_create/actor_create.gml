draw_bars = true;
draw_bar_health_xscale = 1;
draw_bar_health_y = 0;

player_faction = 0;

status_health_max = 100;
status_damage_base = 25;
status_poise_max = 25;

status_buff_list = ds_create("list");

actor_actions_enabled = true;

entity_run_type_scripts("create");

draw_bar_health_damage = status_health_max;
status_damage_total = status_damage_base;
status_poise_current = status_poise_max;