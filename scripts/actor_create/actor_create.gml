draw_bars = true;
draw_bar_health_xscale = 1;
draw_bar_health_y = 0;

player_faction = 0;

physics_gravity_on = true;

status_health_max = 100;
status_damage_base = 25;
status_poise_max = 25;

status_buff_list = ds_create("list");

actor_actions_enabled = true;
ai_enabled = true;

if (global.replay_mode == "record"){
	replay_spawn_x = x;
	replay_spawn_y = y;
	replay_object_index = object_index;
	replay_id = global.replay_id_sequence;
	global.replay_id_sequence++;
}

entity_run_type_scripts("create");

draw_bar_health_damage = status_health_max;
status_damage_total = status_damage_base;
status_poise_current = status_poise_max;

if (ai_enabled && global.replay_mode == "record"){entity_run_type_scripts("ai_create")}
