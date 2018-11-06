status_movespeed_base = 200*PPS;
status_movesnap_base = 0.6*SEC;

status_health_max = 300;
status_damage_base = 20;
status_poise_max = 40;
status_poise_regen = 4*PPS;
status_flinch_duration = 1.5*SEC;

draw_bar_health_xscale = 0.5;
draw_bar_health_y = 30;

collision_persistent = true;

player_faction = 0;

my_attack_bullet_speed = 600*PPS;
my_attack_bullet_range = 800;
my_attack_direction = 1;

my_attack_dash_range = 280;
my_attack_dash_speed = 420*PPS;

my_attack_mana_speed = 800*PPS;

my_attack_channel_ongoing = 0;
my_attack_channel_angle_target = 0;
my_attack_channel_power_current = 0;
my_attack_channel_power_max = 2*SEC;


my_attack_cooldown_value_1 = 0.2*SEC;
my_attack_cooldown_value_2 = 0.5*SEC;
my_attack_cooldown_timer = 0;

my_attack_combo_window_value = 0.6*SEC;
my_attack_combo_window_timer = 0;

my_attack_queue_1 = undefined;
my_attack_queue_2 = undefined;
my_attack_combo = 0;

ai_enabled = false;