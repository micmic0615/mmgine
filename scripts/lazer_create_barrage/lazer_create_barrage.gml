my_barrage_bullet_type = [DefaultBullet, "HeroBulletClear"];
my_barrage_color = make_color_rgb(255,0,0);

my_barrage_angle_turn_rate_cast = 140*PPS;
my_barrage_angle_turn_rate_channel = 100*PPS

my_barrage_bullet_radius = 90;
my_barrage_bullet_speed = 1800*PPS;
my_barrage_bullet_range = 1200;

my_barrage_cast_value = 1.5*SEC;
my_barrage_channel_value = 5*SEC;
my_barrage_cooldown_value = 5*SEC;
my_barrage_interval = 0.4*SEC

my_barrage_damage = 1;
my_barrage_flinch = 1;
my_barrage_push = -40;

my_barrage_particles = array_create(2);
my_barrage_particles[0] = [game_particle_setup_basic(my_barrage_color, 3 + random(5), 0.5, 0.25*SEC), 24, my_barrage_bullet_radius]
my_barrage_particles[1] = [game_particle_setup_basic(c_white, 1 + random(3), 0.25, 0.15*SEC), 18, my_barrage_bullet_radius*0.5]

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
]);

action_barrage_recoil = 80;
action_barrage_collision_destroy_value = INFINITY;