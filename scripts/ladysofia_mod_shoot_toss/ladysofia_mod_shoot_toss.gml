my_shoot_color = make_color_rgb(60,255,120);
my_shoot_bullet_type = [DefaultBullet, "LadySofiaToss"];

my_shoot_bullet_speed = 1200*PPS;
my_shoot_bullet_range = 1240;
my_shoot_bullet_radius = 120;
my_shoot_bullet_count = 1;
my_shoot_bullet_particles = [];
my_shoot_bullet_impact_health = 1;
my_shoot_bullet_explosion_radius = 0;
my_shoot_bullet_explosion_trigger = "death";

my_shoot_bullet_chaos_speed = 0;
my_shoot_bullet_chaos_range = 0;
my_shoot_bullet_chaos_angle = 0;

my_shoot_bullet_angle_spread = 0;
my_shoot_bullet_seek_range = 540;
my_shoot_bullet_seek_turn_rate = 240*PPS;

action_shoot_bullet_tile_phase = true;

my_shoot_damage = [0.35,0];
my_shoot_flinch = [1,0];
my_shoot_push = [0, 0];

my_shoot_fire_recoil = 240;
my_shoot_combo_max = INFINITY;

my_shoot_cast_value = 0.25*SEC;
my_shoot_channel_value = 0.1*SEC;
my_shoot_backswing_value = 0*SEC;
my_shoot_cooldown_value = 0*SEC;

my_shoot_id = "toss";

ladysofia_mod_shoot_apply();

action_shoot[?"animation_cast"] = "channel_ranged";
action_shoot[?"animation_channel"] = "attack_ranged";
action_shoot[?"animation_backswing"] = "rest_ranged";