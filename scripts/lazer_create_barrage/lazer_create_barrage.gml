my_barrage_bullet_type = [DefaultBullet, "HeroBulletClear"];
my_barrage_color = make_color_rgb(255,0,0);

my_barrage_active = false;

my_barrage_angle_active = 0;
my_barrage_angle_turn_rate_cast = 140*PPS;
my_barrage_angle_turn_rate_channel = 100*PPS

my_barrage_bullet_radius = 90;
my_barrage_bullet_speed = 1800*PPS;
my_barrage_bullet_range = 1200;

my_barrage_cast_timer = 0;
my_barrage_cast_value = 1.5*SEC;

my_barrage_channel_timer = 0;
my_barrage_channel_value = 5*SEC;

my_barrage_cooldown_timer = 0;
my_barrage_cooldown_value = 5*SEC;

my_barrage_target_point = [x,y]

my_barrage_damage = [1,0.25];
my_barrage_flinch = [1,0.25];
my_barrage_push = [100, 25];
