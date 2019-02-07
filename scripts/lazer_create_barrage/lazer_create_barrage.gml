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

my_barrage_damage = [1,0];
my_barrage_flinch = [1,0];
my_barrage_push = [-40,0];

my_barrage_particles = array_create(2);
my_barrage_particles[0] = [game_particle_setup_basic(my_barrage_color, 3 + random(5), 0.5, 0.25*SEC), 24, my_barrage_bullet_radius]
my_barrage_particles[1] = [game_particle_setup_basic(c_white, 1 + random(3), 0.25, 0.15*SEC), 18, my_barrage_bullet_radius*0.5];

action_barrage_create([
	/*color*/ my_barrage_color,
	/*bullet_type*/ my_barrage_bullet_type,
	/*bullet_speed*/ my_barrage_bullet_speed,
	/*bullet_range*/ my_barrage_bullet_range,
	/*bullet_radius*/ my_barrage_bullet_radius,
	/*bullet_count*/ 1,
	/*bullet_particles*/ my_barrage_particles,
	/*bullet_impact_health*/ INFINITY,
	/*bullet_explosion_radius*/ 0,
	/*bullet_explosion_trigger*/ "death",	
	/*bullet_chaos_speed*/ 0,
	/*bullet_chaos_range*/ 0,
	/*bullet_chaos_angle*/ 0,
	/*bullet_angle_spread*/ 0,
	/*bullet_seek_range*/ 240*PPS,
	/*bullet_seek_turn_rate*/ 120*PPS,
	/*bullet_seek_angle_limit*/ 90,
	/*bullet_tile_phase*/ false,
	/*damage*/ my_barrage_damage,
	/*flinch*/ my_barrage_flinch,
	/*push*/ my_barrage_push,
	/*fire_recoil*/ 80,
	
	/*turn_rate_cast*/ my_barrage_angle_turn_rate_cast,
	/*turn_rate_channel*/ my_barrage_angle_turn_rate_channel,	
	/*interval*/ my_barrage_interval,
	
	/*cast_value*/ my_barrage_cast_value,
	/*channel_value*/ my_barrage_channel_value,
	/*backswing_value*/ 0,
	/*cooldown_value*/ my_barrage_cooldown_value	
])