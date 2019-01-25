my_shoot_bullet_type = [DefaultBullet, "HeroBullet1"];
my_shoot_flair_color = make_color_rgb(0,255,255);

my_shoot_bullet_radius = 64;
my_shoot_bullet_speed = 1200*PPS;
my_shoot_bullet_range = 800;
my_shoot_bullet_count = 1;
my_shoot_bullet_explosion = 80;
my_shoot_poise_cost = 0;

my_shoot_recoil_range = 90;

my_shoot_combo_max = INFINITY;
my_shoot_cast_value = 0.1*SEC;
my_shoot_channel_value = 0.2*SEC;
my_shoot_cooldown_value = 0.05*SEC;

my_shoot_damage = [1,0.2];
my_shoot_flinch = [1,0.2];
my_shoot_push = [100, 10];

action_shoot_angle_chaos = 0;
action_shoot_angle_spead = 60;

action_shoot_bullet_seek_range = 240;
action_shoot_bullet_seek_turn_rate = 160*PPS;
action_shoot_bullet_collision_destroy_value = 1;

action_shoot_flag_explode_trigger = "death";

my_charge_min = 1*SEC;
my_charge_max = 4*SEC;
my_charge_factor_size = 1;
my_charge_factor_speed = 1;
my_charge_factor_range = 1;
my_charge_factor_damage = 2;
my_charge_factor_flinch = 5;
my_charge_factor_explosion = 1;

my_charge_divider_cast = 1;
my_charge_divider_channel = 1;

hero_skill_set_shoot_mod_apply();