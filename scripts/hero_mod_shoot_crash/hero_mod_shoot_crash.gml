hero_mod_shoot_do();

my_shoot_bullet_type = [DefaultBullet, "HeroBullet4"]
my_shoot_flair_color = make_color_rgb(255,255,0);

my_shoot_bullet_radius = 90;
my_shoot_bullet_speed = 1800*PPS;
my_shoot_bullet_range = 480;
my_shoot_bullet_explosion = 40;

my_shoot_recoil_range = 30;

my_shoot_cast_value = 0.5*SEC;
my_shoot_backswing_value = 0.15*SEC;
my_shoot_channel_value = 0.25*SEC;

my_shoot_damage = [0.5,0.1];
my_shoot_flinch = [3,0.6];
my_shoot_push = [-40, 0];

action_shoot_bullet_seek_range = 180;
action_shoot_bullet_seek_turn_rate = 640*PPS;

hero_skill_set_shoot_mod_apply();