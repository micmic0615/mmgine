my_shoot_color = make_color_rgb(60,255,90);
my_shoot_bullet_type = [DefaultBullet, "LadySofiaMelee"];

my_shoot_bullet_speed = 2400*PPS;

my_shoot_bullet_impact_health = INFINITY;
my_shoot_bullet_explosion_radius = 0;
my_shoot_bullet_explosion_trigger = "death";

my_shoot_bullet_chaos_speed = 0;
my_shoot_bullet_chaos_range = 0;
my_shoot_bullet_chaos_angle = 0;

my_shoot_bullet_seek_range = 0;
my_shoot_bullet_seek_turn_rate = 0;

action_shoot_bullet_tile_phase = true;

my_shoot_damage = [1/4,0];
my_shoot_flinch = [1/4,0];
my_shoot_push = [60, 0];

my_shoot_fire_recoil = 90;
my_shoot_combo_max = INFINITY;

my_shoot_cast_value = 0.8*SEC;
my_shoot_channel_value = 0.4*SEC;
my_shoot_backswing_value = 0*SEC;
my_shoot_cooldown_value = 0*SEC;

my_shoot_id = "melee";

switch (my_invoke_boss_phase){
	case 0:
		my_shoot_bullet_count = 8;
		my_shoot_bullet_range = 480;
		my_shoot_bullet_angle_spread = 120;
		my_shoot_bullet_radius = 360;
		my_shoot_bullet_particles = [
			[game_particle_setup_basic(my_shoot_color, 2, 0.35, 0.25*SEC), 6, my_shoot_bullet_radius*0.5]
		];
		break
		
	case 1:
		my_shoot_bullet_count = 10;
		my_shoot_bullet_range = 500;
		my_shoot_bullet_angle_spread = 110;
		my_shoot_bullet_radius = 380;
		my_shoot_bullet_particles = [
			[game_particle_setup_basic(my_shoot_color, 1.75, 0.35, 0.25*SEC), 4, my_shoot_bullet_radius*0.5],
			[game_particle_setup_basic(my_invoke_color_1, 2.5, 0.35, 0.25*SEC), 4, my_shoot_bullet_radius*0.5]
		];
		break
		
	case 2:
		my_shoot_bullet_count = 12;
		my_shoot_bullet_range = 520;
		my_shoot_bullet_angle_spread = 100;
		my_shoot_bullet_radius = 400;
		my_shoot_bullet_particles = [
		[game_particle_setup_basic(my_shoot_color, 2, 0.35, 0.25*SEC), 4, my_shoot_bullet_radius*0.5],
			[game_particle_setup_basic(my_invoke_color_2, 3, 0.35, 0.25*SEC), 4, my_shoot_bullet_radius*0.5]
		];
		break
}


if (ladysofia_action_shoot_set()){
	action_shoot[?"animation_cast"] = "channel_melee";
	action_shoot[?"animation_channel"] = "attack_melee";
	action_shoot[?"animation_backswing"] = "rest_melee";
};

