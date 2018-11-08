status_movespeed_base = 420*PPS;
status_movesnap_base = 1*SEC;

status_health_max = 4000;
status_damage_base = 15;
status_poise_max = 25;
status_poise_regen = 0.5*PPS;
status_flinch_duration = 6*SEC;

draw_bar_health_xscale = 0.5;
draw_bar_health_y = 45;

collision_persistent = true;
collision_solid_entities = false;
collision_enabled_actors = true;
collision_enabled_bullets = true;
collision_enabled_doodads = false;

player_faction = 1;
player_boss = true;
player_boss_name = "The Swarm";

animation_rotatable = true;

my_attack_cooldown_value = 14*SEC;
my_attack_cooldown_timer = 0;

my_attack_cast_value = 7*SEC;
my_attack_cast_timer = 0;

my_attack_cast_armor_health = 0;
my_attack_cast_armor_poise = 100;
my_attack_cast_movespeed = 640*PPS;
my_attack_cast_movesnap = 0.5*SEC;

my_attack_channel_ongoing = 0;
my_attack_channel_angle_target = 0;
my_attack_channel_power_current = 0;
my_attack_channel_power_max = 4*SEC;
my_attack_channel_angle_warning = 0
my_attack_channel_range_warning = 0;

my_attack_push_distance = 0;
my_attack_dash_distance = 600;

my_attack_collide_cooldown_timer = 0;
my_attack_collide_cooldown_value = 0.15*SEC;

my_dash_cooldown_value = 0.5*SEC;
my_dash_cooldown_timer = 0;
my_dash_range = 500;
my_dash_speed = 500*PPS;

my_clone_original = true;
my_clone_core = id;
my_clone_count_total = 6;
my_clone_count = 6;
my_clone_can_spawn = true;
my_clone_spawn_area = 800;

my_clone_push_cooldown_value = 0.25*SEC;
my_clone_push_cooldown_timer = 0;



//my_attack_dash_range = 180;
//my_attack_dash_speed = 360*PPS;

//my_attack_cooldown_value = 4*SEC;
//my_attack_cooldown_timer = 0;



//my_attack_bullet_speed = 1000*PPS;
//my_attack_bullet_range = 1600;