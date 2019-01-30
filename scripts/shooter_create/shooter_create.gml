status_movespeed_base = 320*PPS;
status_movesnap_base = 2*SEC;

status_health_max = 250;
status_damage_base = 15;
status_flinch_base = 10;

status_poise_max = 60;
status_flinch_duration = 5*SEC;

draw_bar_health_xscale = 0.4;
draw_bar_health_y = 45;

collision_persistent = true;
collision_solid_entities = false;
collision_enabled_actors = true;
collision_enabled_bullets = true;
collision_enabled_doodads = false;

player_faction = 1;

animation_rotatable = false;

my_attack_channel_ongoing = 0;
my_attack_channel_angle_target = 0;
my_attack_channel_power_current = 0;
my_attack_channel_power_max = 1.5*SEC;
my_attack_channel_angle_warning = 0;
my_attack_channel_turn_rate = 180*PPS;

my_attack_dash_range = 180;
my_attack_dash_speed = 360*PPS;

my_attack_cooldown_value = 4*SEC;
my_attack_cooldown_timer = 0;

my_attack_cast_value = 0.5*SEC;
my_attack_cast_timer = 0;

my_attack_bullet_speed = 1000*PPS;
my_attack_bullet_range = 1600;