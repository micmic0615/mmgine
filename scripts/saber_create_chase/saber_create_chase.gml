my_chase_distance = 00
my_chase_movespeed_set = 580*PPS;
my_chase_movesnap_set = 0.25*SEC;
my_chase_active_value = 6.5*SEC;
my_chase_cooldown_value = 6*SEC;
my_chase_color = make_color_rgb(125,30,255);


my_chase_sword_type = [DefaultBullet, "HeroBulletClear"]
//my_chase_sword_type = [DefaultBullet, "DefaultBullet"]
my_chase_sword_speed = 580*PPS;
my_chase_sword_range = 240;
my_chase_sword_radius = 32;
my_chase_sword_disable_timer = 0;
my_chase_color_particles = make_color_rgb(210,90,220)

my_chase_jump_min_distance = 720;
my_chase_jump_count = 0;
my_chase_jump_max = 3;
my_chase_jump_range = 640;
my_chase_jump_speed = 1920*PPS;
my_chase_jump_cooldown_timer = 0;
my_chase_jump_cooldown_value = 2*SEC;
my_chase_jump_point = [0,0];

my_chase_jump_active = false;
my_chase_jump_cast_timer = 0;
my_chase_jump_cast_value = 0.5*SEC;

my_chase_jump_mirage_timer = 0;
my_chase_jump_mirage_down = false;

action_chase_create([
	/*distance*/ my_chase_distance,
	/*movespeed_set*/ my_chase_movespeed_set,
	/*movesnap_set*/ my_chase_movesnap_set,
	/*active_value*/ my_chase_active_value,
	/*cooldown_value*/ my_chase_cooldown_value,
	/*color*/ my_chase_color
])