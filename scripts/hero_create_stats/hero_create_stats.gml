global.hero_stats_health = 100;
global.hero_stats_poise = 30;
global.hero_stats_damage = 10;
global.hero_stats_flinch = 10;

status_poise_regen_base = 1.5*PPS;
status_flinch_duration = 2.5*SEC;
status_movespeed_base = 500*PPS

if (ROOM.player_main_actor != id){
	global.hero_stats_health = 240;
	global.hero_stats_poise = 50;
	
	status_poise_regen_base = 10*PPS;
	status_flinch_duration = 2*SEC;
	
	collision_enabled_actors = false;
}

my_dash_combo_max = 2;
action_dash[?"combo_max"] = my_dash_combo_max;
action_dash_cooldown_reset();

my_dash_speed = 580*PPS;
my_dash_range = 340;
action_dash[?"speed"] = my_dash_speed;
action_dash[?"range"] = my_dash_range;

my_dash_charge_cost = 0;

my_dash_channel = 0.1*SEC;

my_charge_min = 2*SEC;
my_charge_max = 6*SEC;

if (ROOM.player_main_actor != id){
	my_charge_min = 1.5*SEC;
	my_charge_max = 4*SEC;
}

actor_stats_adjust_health(global.hero_stats_health);
actor_stats_adjust_poise(global.hero_stats_poise);
status_damage_base = global.hero_stats_damage;
status_flinch_base = global.hero_stats_flinch;

