my_shoot_color = make_color_rgb(255,255,0);
my_shoot_bullet_type = [DefaultBullet, "ShooterBullet2"];

my_shoot_bullet_speed = 1600*PPS;
my_shoot_bullet_range = 540;
my_shoot_bullet_radius = 180;
my_shoot_bullet_explosion_radius = 320;

my_shoot_damage = [1,1];
my_shoot_flinch = [1,1];
my_shoot_push = [0,0];

my_shoot_fire_recoil = 220;

my_shoot_cast_value = 0.75*SEC;
my_shoot_channel_value = 0.2*SEC;
my_shoot_backswing_value = 0.2*SEC;
my_shoot_cooldown_value = 5*SEC;

my_shoot_vacuum_range = 640;
my_shoot_vacuum_range_min = 160;
my_shoot_vacuum_pull = 40;
my_shoot_vacuum_speed = 0.2*SEC;
my_shoot_vacuum_interval = 0.1*SEC;

action_shoot_create([
	/*color*/ my_shoot_color,
	/*bullet_type*/ my_shoot_bullet_type,
	/*bullet_speed*/ my_shoot_bullet_speed,
	/*bullet_range*/ my_shoot_bullet_range,
	/*bullet_radius*/ my_shoot_bullet_radius,
	/*bullet_count*/ 1,
	/*bullet_particles*/ [],
	/*bullet_impact_health*/ 1,
	/*bullet_explosion_radius*/ my_shoot_bullet_explosion_radius,
	/*bullet_explosion_trigger*/ "always",	
	/*bullet_chaos_speed*/ 0,
	/*bullet_chaos_range*/ 0,
	/*bullet_chaos_angle*/ 0,
	/*bullet_angle_spread*/ 0,
	/*bullet_seek_range*/ 0,
	/*bullet_seek_turn_rate*/ 0,
	/*bullet_seek_angle_limit*/ 0,
	/*bullet_seek_no_decay*/ false,
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
]);