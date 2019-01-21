status_movespeed_base = 600*PPS;
status_movesnap_base = 0.6*SEC;

status_health_max = 200;
status_damage_base = 20;
status_poise_max = 30;
status_poise_regen = 1.5*PPS;
status_flinch_duration = 2*SEC;

draw_bar_health_xscale = 0.5;
draw_bar_health_y = 30;

collision_persistent = true; 

player_faction = 0;

my_attack_bullet_speed = 900*PPS;
my_attack_bullet_range = 800;
my_attack_direction = 1;

my_attack_bullet_flinch_damage = 25;

my_rally_limit = status_health_max;
my_rally_degen = 5*PPS;
my_rally_lifesteal = 20;
my_rally_lifebank = 0;

my_attack_beatdown_bullet_count = 3
my_attack_beatdown_bullet_damage_factor = 0.65
my_attack_beatdown_damage_amplification = 1.25;

my_attack_recoil_range = 180;
my_attack_recoil_speed = 420*PPS;

my_attack_dash_range = 360;
my_attack_dash_speed = 420*PPS;

my_attack_mana_speed = 600*PPS;
my_attack_mana_speed_duration = 2*SEC;

my_attack_channel_ongoing = 0;
my_attack_channel_angle_target = 0;
my_attack_channel_power_current = 0;
my_attack_channel_power_max = 2.5*SEC;
my_attack_channel_power_bonus_factor = 2;
my_attack_channel_power_min = 0.25;


my_attack_cooldown_value_1 = 0.15*SEC;
my_attack_cooldown_value_2 = 0;
my_attack_cooldown_timer_1 = 0;
my_attack_cooldown_timer_2 = 0;
//my_attack_cooldown_value_3 = 4*SEC;
//my_attack_cooldown_timer_3 = 0;

my_attack_cast_value_1 = 0.2*SEC;
my_attack_cast_value_2 = 0.25*SEC;
my_attack_cast_timer_1 = 0;
my_attack_cast_timer_2 = 0;

my_attack_cast_value_3 = 1*SEC;
my_attack_cast_timer_3 = 0;
my_attack_3_immortal_duration = 1.5*SEC;

my_attack_cast_value_4 = 1*SEC;
my_attack_cast_timer_4 = 0;
my_attack_delay_value_4 = 0.4*SEC;
my_attack_delay_timer_4 = 0;

my_time_stop_trigger = false;
my_time_stop_channel = false;
my_time_stop_degen_interval_value = 1*SEC;
my_time_stop_degen_interval_timer = 0;
my_time_stop_degen_damage = status_health_max*0.01;
my_time_stop_attack_cost = status_health_max*0.02;

my_time_stop_attack_mirage = false;

my_attack_cooldown_finisher_delay_1 = 0.9*SEC;
my_attack_cooldown_finisher_delay_2 = 1.2*SEC;

my_attack_combo_1_window_value = 0.5*SEC;
my_attack_combo_1_window_timer = 0;
my_attack_combo_2_window_value = 0.8*SEC;
my_attack_combo_2_window_timer = 0;

my_attack_super_duration = 0;
my_attack_super_target_angle = [0,0];

my_attack_queue_1 = undefined;
my_attack_queue_2 = undefined;
my_attack_combo_1 = 0;
my_attack_combo_2 = 0;

ai_enabled = false;


my_shield_damage_accumulated = 0;
my_shield_damage_treshold = status_health_max*0.4;
my_shield_damage_regen = (my_shield_damage_treshold/40)*PPS;

my_grit_cooldown_timer = 0;
my_grit_cooldown_value = 60*SEC;