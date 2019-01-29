status_movesnap_base = 0.6*SEC;
draw_bar_health_xscale = 0.5;
draw_bar_health_y = 30;

collision_persistent = true; 
player_faction = 0;

status_health_current = status_health_max;
status_poise_current = status_poise_max;

hero_skill_set_list();

hero_create_charge();

hero_create_shoot();

hero_create_dash();

hero_create_stats();

hero_create_beatdown();

hero_create_passive();

hero_create_autofire();

hero_create_records();