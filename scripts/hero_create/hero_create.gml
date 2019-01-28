status_movespeed_base = 600*PPS;
status_movesnap_base = 0.6*SEC;

status_health_max = 100;
status_damage_base = 20;
status_flinch_base = 10;
status_poise_max = 25;
status_poise_regen = 1.25*PPS;
status_flinch_duration = 2*SEC;

draw_bar_health_xscale = 0.5;
draw_bar_health_y = 30;

collision_persistent = true; 

player_faction = 0;

hero_skill_set_list();

hero_create_shoot();

hero_create_dash();

hero_create_beatdown();




