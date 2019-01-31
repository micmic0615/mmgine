my_shoot_bullet_type = [DefaultBullet, "ShooterBullet1"];
my_shoot_flair_color = make_color_rgb(255,0,0);

my_shoot_bullet_radius = 54;
my_shoot_bullet_speed = 1000*PPS;
my_shoot_bullet_range = 1200;
my_shoot_bullet_count = 1;
my_shoot_bullet_explosion = 120;

my_shoot_recoil_range = 90;

my_shoot_cast_value = 2.5*SEC;
my_shoot_channel_value = 0.4*SEC;
my_shoot_backswing_value = 0.2*SEC;
my_shoot_cooldown_value = 3*SEC;

my_shoot_combo_max = 3;

my_shoot_damage = [1,0.25];
my_shoot_flinch = [1,0.25];
my_shoot_push = [100, 25];

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
	/*flair_color*/ my_shoot_flair_color,
]);