hero_mod_shoot_do();

my_shoot_bullet_type = [DefaultBullet, "HeroBullet2"];
my_shoot_flair_color = make_color_rgb(30,255,30);

my_shoot_bullet_radius = 44;
my_shoot_bullet_range = 520;
my_shoot_bullet_count = 5;
my_shoot_bullet_explosion = 50;

my_shoot_cast_value = 0.15*SEC;

my_shoot_damage = [0.4,0.15];
my_shoot_flinch = [0.25,0.1];
my_shoot_push = [30, 0];

action_shoot_bullet_seek_range = 120;
action_shoot_bullet_seek_turn_rate = 80*PPS;

hero_skill_set_shoot_mod_apply();