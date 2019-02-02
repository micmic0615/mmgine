hero_mod_shoot_do();

my_shoot_bullet_type = [DefaultBullet, "HeroBullet2"];
my_shoot_flair_color = make_color_rgb(30,255,30);

my_shoot_bullet_radius = 44;
my_shoot_bullet_range = 440;
my_shoot_bullet_speed = 800*PPS;
my_shoot_bullet_count = 5;
my_shoot_bullet_explosion = 50;

my_shoot_cast_value = 0.15*SEC;
my_shoot_backswing_value = 0.15*SEC;

my_shoot_damage = [0.4,0.15];
my_shoot_flinch = [0.15,0];
my_shoot_push = [25, 0];

action_shoot_angle_chaos = 20;
action_shoot_range_chaos = 200;
action_shoot_speed_chaos = 160*PPS;

action_shoot_bullet_seek_range = 120;
action_shoot_bullet_seek_turn_rate = 80*PPS;

hero_skill_set_shoot_mod_apply();