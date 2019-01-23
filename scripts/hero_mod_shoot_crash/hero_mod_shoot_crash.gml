hero_mod_shoot_do();

my_shoot_bullet_type = [DefaultBullet, "HeroBullet4"]
my_shoot_flair_color = make_color_rgb(255,255,0);

my_shoot_bullet_radius = 120;
my_shoot_bullet_speed = 1800*PPS;
my_shoot_bullet_range = 420;
my_shoot_bullet_explosion = 150;

my_shoot_recoil_range = 120;

my_shoot_cast_value = 0.5*SEC;
my_shoot_channel_value = 0.25*SEC;

my_shoot_damage = [1.25,0.2];
my_shoot_flinch = [3,0.75];
my_shoot_push = [-40, 0];

action_shoot_bullet_seek_range = 180;
action_shoot_bullet_seek_turn_rate = 640*PPS;

hero_mod_shoot_apply();