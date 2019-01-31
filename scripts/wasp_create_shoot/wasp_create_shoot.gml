my_shoot_bullet_type = [DefaultBullet, "PelterBullet1"];
my_shoot_flair_color = make_color_rgb(255,0,0);

my_shoot_bullet_radius = 32;
my_shoot_bullet_speed = 1800*PPS;
my_shoot_bullet_range = 540;
my_shoot_bullet_count = 10;
my_shoot_bullet_explosion = 80;

my_shoot_recoil_range = 90;

my_shoot_cast_value = 1*SEC;
my_shoot_channel_value = 0.3*SEC;
my_shoot_backswing_value = 0*SEC;
my_shoot_cooldown_value = 0*SEC;

my_shoot_combo_max = 3;

my_shoot_damage = [1/my_shoot_bullet_count,0.25/my_shoot_bullet_count];
my_shoot_flinch = [1/my_shoot_bullet_count,0.25/my_shoot_bullet_count];
my_shoot_push = [20, 10];

action_shoot_create([
	/*bullet_type*/ my_shoot_bullet_type,
	/*bullet_radius*/ my_shoot_bullet_radius,
	/*bullet_speed*/ my_shoot_bullet_speed,
	/*bullet_range*/ my_shoot_bullet_range,
	/*bullet_count*/ my_shoot_bullet_count,
	/*bullet_explosion*/ my_shoot_bullet_explosion,
	/*recoil_speed*/ 420*PPS,
	/*recoil_range*/ my_shoot_recoil_range,
	/*cast_value*/ my_shoot_cast_value,
	/*channel_value*/ my_shoot_channel_value,
	/*backswing_value*/ my_shoot_backswing_value,
	/*cooldown_value*/ my_shoot_cooldown_value,
	/*combo_max*/ my_shoot_combo_max,
	/*damage*/ my_shoot_damage,
	/*flinch*/ my_shoot_flinch,
	/*push*/ my_shoot_push,
	/*flair_color*/ my_chase_color,
]);

action_shoot_angle_chaos = 30;
action_shoot_range_chaos = 340;
action_shoot_speed_chaos = 900*PPS;

action_shoot_bullet_seek_range = 120;
action_shoot_bullet_seek_turn_rate = 80*PPS;

action_shoot_bullet_particles = [game_particle_setup_basic(my_chase_color, 1.5, 0.5, 0.3*SEC), 3, action_shoot_bullet_radius];