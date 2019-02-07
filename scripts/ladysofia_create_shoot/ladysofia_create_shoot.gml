my_shoot_bullet_type = [DefaultBullet, "LadySofiaMelee"];
my_shoot_color = make_color_rgb(60,255,120);

my_shoot_bullet_radius = 360;
my_shoot_bullet_speed = 1800*PPS;
my_shoot_bullet_range = 480;
my_shoot_bullet_count = 9;
my_shoot_bullet_explosion_radius = 0;

my_shoot_fire_recoil = 90;

my_shoot_cast_value = 0.35*SEC;
my_shoot_channel_value = 0.3*SEC;
my_shoot_backswing_value = 0*SEC;
my_shoot_cooldown_value = 0*SEC;

my_shoot_combo_max = 3;

my_shoot_damage = [1/3,0];
my_shoot_flinch = [1/3,0];
my_shoot_push = [0, 0];

action_shoot_create([
	/*bullet_type*/ my_shoot_bullet_type,
	/*bullet_radius*/ my_shoot_bullet_radius,
	/*bullet_speed*/ my_shoot_bullet_speed,
	/*bullet_range*/ my_shoot_bullet_range,
	/*bullet_count*/ my_shoot_bullet_count,
	/*bullet_explosion*/ my_shoot_bullet_explosion_radius,
	/*recoil_speed*/ 420*PPS,
	/*recoil_range*/ my_shoot_fire_recoil,
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

my_shoot_bullet_chaos_angle = 0;
my_shoot_bullet_chaos_range = 0;
my_shoot_bullet_chaos_speed = 0*PPS;

my_shoot_bullet_angle_spread = 120;
action_shoot_bullet_tile_phase = true;

my_shoot_bullet_seek_range = 120;
my_shoot_bullet_seek_turn_rate = 80*PPS;

my_shoot_bullet_impact_health = INFINITY;
my_shoot_bullet_seek_range = 0;
my_shoot_bullet_seek_turn_rate = 0;

action_shoot_animation_channel = "channel_melee";
action_shoot_animation_attack = "attack_melee";
action_shoot_animation_rest = "attack_melee";

action_shoot_bullet_particles = [game_particle_setup_basic(my_shoot_color, 1, 0.35, 0.25*SEC), 24, action_shoot_bullet_radius*0.5];