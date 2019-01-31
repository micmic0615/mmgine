hero_mod_shoot_do();

my_shoot_bullet_type = [DefaultBullet, "HeroBullet3"];
my_shoot_flair_color = make_color_rgb(255,0,255);

my_shoot_bullet_radius = 36;
my_shoot_bullet_speed = 1400*PPS;
my_shoot_bullet_range = 780;
my_shoot_bullet_explosion = 40;

my_shoot_recoil_range = 30;

my_shoot_cast_value = 1;
my_shoot_channel_value = 9;
my_shoot_backswing_value = 1;
my_shoot_cooldown_value = 0*SEC;

my_shoot_damage = [0.6,0.1];
my_shoot_flinch = [0.25,0.05];
my_shoot_push = [15, 0];

action_shoot_angle_chaos = 24;

action_shoot_bullet_seek_range = 300;
action_shoot_bullet_seek_turn_rate = 240*PPS;

hero_skill_set_shoot_mod_apply();