hero_mod_shoot_do();

my_shoot_bullet_type = [DefaultBullet, "HeroBullet6"];
my_shoot_flair_color = make_color_rgb(255,125,0);

my_shoot_bullet_radius = 100;
my_shoot_bullet_speed = 1000*PPS;
my_shoot_bullet_range = 1000;
my_shoot_bullet_explosion = 40;

my_shoot_recoil_range = 150;

my_shoot_cast_value = 0.2*SEC;

my_shoot_damage = [0.9,0.2];
my_shoot_flinch = [0.5,0.1];
my_shoot_push = [0, 0];

action_shoot_bullet_seek_range = 320;
action_shoot_bullet_seek_turn_rate = 200*PPS;
action_shoot_bullet_collision_destroy_value = 3;

hero_skill_set_shoot_mod_apply();