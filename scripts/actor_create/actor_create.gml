draw_bars = true;
draw_bar_health_xscale = 1;
draw_bar_health_y = 0;

player_faction = 0;

physics_gravity_on = true;

status_health_max = 100;
status_damage_base = 25;
status_flinch_base = 25;
status_poise_max = 20;
status_poise_regen = 2*PPS;
status_flinch_duration = 2*SEC;
status_poise_freeze_timer = 0*SEC;
status_poise_freeze_value = 0.5*SEC;

status_iframe = false;

status_armor_health = 0;
status_armor_poise = 0;

status_buff_list = ds_create("list");

actor_actions_enabled = true;
actor_actions_idle = true;
actor_actions_id = "none";

collision_persistent = true;

ai_enabled = true;
ai_delay = 1*SEC;

player_boss = false;
player_boss_name = "actor";

entity_run_type_scripts("create");

draw_bar_health_damage = status_health_max;
status_damage_total = status_damage_base;
status_flinch_total = status_flinch_base;
status_poise_current = status_poise_max;

if (ai_enabled && global.replay_mode == "record"){entity_run_type_scripts("ai_create")}
