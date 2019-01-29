hero_mod_shoot_do()

my_shoot_bullet_type = [DefaultBullet, "HeroBullet5"];
my_shoot_flair_color = make_color_rgb(255,30,30);

my_shoot_bullet_radius = 54;
my_shoot_bullet_speed = 200*PPS;
my_shoot_bullet_range = 300;
my_shoot_bullet_explosion = 320;

my_shoot_recoil_range = 180;

my_shoot_cast_value = 0.25*SEC;
my_shoot_backswing_value = 0.25*SEC;

my_shoot_damage = [0.4, 0.8];
my_shoot_flinch = [0.25, 0.5];
my_shoot_push = [0, 60];

action_shoot_bullet_seek_range = 80;
action_shoot_bullet_seek_turn_rate = 20*PPS;

action_shoot_flag_explode_trigger = "always";

hero_skill_set_shoot_mod_apply();