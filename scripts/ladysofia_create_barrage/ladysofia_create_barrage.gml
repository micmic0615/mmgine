my_barrage_bullet_type = [DefaultBullet, "LadySofiaJab"];
my_barrage_color = make_color_rgb(60,255,125);

my_barrage_angle_turn_rate_cast = 120*PPS;
my_barrage_angle_turn_rate_channel = 180*PPS

my_barrage_bullet_radius = 240;
my_barrage_bullet_speed = 800*PPS;
my_barrage_bullet_range = 1200;

my_barrage_cast_value = 0.5*SEC;
my_barrage_channel_value = 2.5*SEC;
my_barrage_cooldown_value = 0*SEC;
my_barrage_interval = 0.15*SEC

my_barrage_damage = 0.5;
my_barrage_flinch = 0.5;
my_barrage_push = 80;

my_barrage_particles = [];

action_barrage_create([
	/*bullet_type*/ my_barrage_bullet_type,
	/*color*/ my_barrage_color,
	/*angle_turn_rate_cast*/ my_barrage_angle_turn_rate_cast,
	/*angle_turn_rate_channel*/ my_barrage_angle_turn_rate_channel,
	/*bullet_radius*/ my_barrage_bullet_radius,
	/*bullet_speed*/ my_barrage_bullet_speed,
	/*bullet_range*/ my_barrage_bullet_range,
	/*cast_value*/ my_barrage_cast_value,
	/*channel_value*/ my_barrage_channel_value,
	/*cooldown_value*/ my_barrage_cooldown_value,
	/*interval*/ my_barrage_interval,
	/*damage*/ my_barrage_damage,
	/*flinch*/ my_barrage_flinch,
	/*push*/ my_barrage_push,
	/*particles*/ my_barrage_particles
])

action_barrage_recoil = -40;
action_barrage_angle_chaos = 60;
action_barrage_animation_channel = "channel_jab";
action_barrage_animation_attack = "attack_jab";

action_barrage_bullet_seek_range = 0;
action_barrage_bullet_seek_turn_rate = 0;
action_barrage_bullet_seek_angle_limit = 0;