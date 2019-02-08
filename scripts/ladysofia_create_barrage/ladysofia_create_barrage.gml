my_barrage_bullet_type = [DefaultBullet, "LadySofiaJab"];
my_barrage_color = make_color_rgb(60,255,125);

my_barrage_angle_turn_rate_cast = 120*PPS;
my_barrage_angle_turn_rate_channel = 180*PPS

my_barrage_bullet_radius = 240;
my_barrage_bullet_speed = 900*PPS;
my_barrage_bullet_range = 900;

my_barrage_cast_value = 0.65*SEC;
my_barrage_channel_value = 2*SEC;
my_barrage_cooldown_value = 0*SEC;
my_barrage_interval = 0.15*SEC

my_barrage_damage = [0.5,0];
my_barrage_flinch = [0.25,0];
my_barrage_push = [0,0];

my_barrage_particles = [];

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
	/*bullet_seek_range*/ 0,
	/*bullet_seek_turn_rate*/ 0,
	/*bullet_seek_angle_limit*/ 0,
	/*bullet_seek_no_decay*/ false,
	/*bullet_tile_phase*/ false,
	/*damage*/ my_barrage_damage,
	/*flinch*/ my_barrage_flinch,
	/*push*/ my_barrage_push,
	/*fire_recoil*/ -20,
	
	/*turn_rate_cast*/ my_barrage_angle_turn_rate_cast,
	/*turn_rate_channel*/ my_barrage_angle_turn_rate_channel,	
	/*interval*/ my_barrage_interval,
	
	/*cast_value*/ my_barrage_cast_value,
	/*channel_value*/ my_barrage_channel_value,
	/*backswing_value*/ 0,
	/*cooldown_value*/ my_barrage_cooldown_value	
])

action_barrage[?"animation_cast"] = "channel_jab";
action_barrage[?"animation_channel"] = "attack_jab";
action_barrage[?"animation_backswing"] = "rest";
