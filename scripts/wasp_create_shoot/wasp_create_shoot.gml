my_shoot_bullet_type = [DefaultBullet, "ShooterBullet3"];
my_shoot_color = make_color_rgb(255,0,0);

my_shoot_bullet_speed = 1800*PPS;
my_shoot_bullet_range = 640;
my_shoot_bullet_radius = 32;
my_shoot_bullet_count = 10;

my_shoot_bullet_chaos_speed = 900*PPS;
my_shoot_bullet_chaos_range = 340;
my_shoot_bullet_chaos_angle = 30;

my_shoot_damage = [1/my_shoot_bullet_count,0.25/my_shoot_bullet_count];
my_shoot_flinch = [1/my_shoot_bullet_count,0.25/my_shoot_bullet_count];
my_shoot_push = [20, 10];

my_shoot_fire_recoil = 150;

my_shoot_cast_value = 0.5*SEC;
my_shoot_channel_value = 0.3*SEC;
my_shoot_backswing_value = 0*SEC;
my_shoot_cooldown_value = 0*SEC;

action_shoot_create([
	/*color*/ my_shoot_color,
	/*bullet_type*/ my_shoot_bullet_type,
	/*bullet_speed*/ my_shoot_bullet_speed,
	/*bullet_range*/ my_shoot_bullet_range,
	/*bullet_radius*/ my_shoot_bullet_radius,
	/*bullet_count*/ my_shoot_bullet_count,
	/*bullet_particles*/ [[game_particle_setup_basic(my_chase_color, 1.5, 0.5, 0.3*SEC), 3, my_shoot_bullet_radius]],
	/*bullet_impact_health*/ 1,
	/*bullet_explosion_radius*/ 0,
	/*bullet_explosion_trigger*/ "death",	
	/*bullet_chaos_speed*/ my_shoot_bullet_chaos_speed,
	/*bullet_chaos_range*/ my_shoot_bullet_chaos_range,
	/*bullet_chaos_angle*/ my_shoot_bullet_chaos_angle,
	/*bullet_angle_spread*/ 60,
	/*bullet_seek_range*/ 120,
	/*bullet_seek_turn_rate*/ 80*PPS,
	/*bullet_seek_angle_limit*/ 180,
	/*bullet_seek_no_decay*/ true,
	/*bullet_tile_phase*/ false,
	/*damage*/ my_shoot_damage,
	/*flinch*/ my_shoot_flinch,
	/*push*/ my_shoot_push,
	/*fire_recoil*/ my_shoot_fire_recoil,
	
	/*combo_max*/ INFINITY,
	
	/*cast_value*/ my_shoot_cast_value,
	/*channel_value*/ my_shoot_channel_value,
	/*backswing_value*/ my_shoot_backswing_value,
	/*cooldown_value*/ my_shoot_cooldown_value	
])