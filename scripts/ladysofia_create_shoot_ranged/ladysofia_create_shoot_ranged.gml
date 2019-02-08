my_shoot_color = make_color_rgb(60,255,90);
my_shoot_bullet_type = [DefaultBullet, "LadySofiaToss"];

my_shoot_bullet_radius = 120;

my_shoot_bullet_impact_health = 1;
my_shoot_bullet_explosion_radius = 0;
my_shoot_bullet_explosion_trigger = "death";

my_shoot_bullet_chaos_speed = 0;
my_shoot_bullet_chaos_range = 0;
my_shoot_bullet_chaos_angle = 0;

my_shoot_bullet_angle_spread = 60;
my_shoot_bullet_seek_range = 540;
my_shoot_bullet_seek_turn_rate = 540*PPS;

action_shoot_bullet_tile_phase = false;

my_shoot_damage = [0.35,0];
my_shoot_flinch = [0.5,0];
my_shoot_push = [30, 0];


my_shoot_combo_max = INFINITY;

my_shoot_backswing_value = 0*SEC;
my_shoot_cooldown_value = 0*SEC;

my_shoot_fire_recoil = 0;

my_shoot_id = "ranged";

switch (my_invoke_boss_phase){
	case 0:
		my_shoot_bullet_count = 1;
		my_shoot_bullet_range = 1200;
		my_shoot_bullet_speed = 1000*PPS;
		my_shoot_cast_value = 0.25*SEC;
		my_shoot_channel_value = 0.15*SEC;
		my_shoot_bullet_particles = [
			[game_particle_setup_basic(my_shoot_color, 2, 0.35, 0.25*SEC), 3, my_shoot_bullet_radius*0.5]
		];
		break
		
	case 1:
		my_shoot_bullet_count = 1;
		my_shoot_bullet_range = 1500;
		my_shoot_bullet_speed = 1100*PPS;
		my_shoot_cast_value = 0.25*SEC;
		my_shoot_channel_value = 0.1*SEC;
		my_shoot_bullet_particles = [
			[game_particle_setup_basic(my_shoot_color, 1.5, 0.35, 0.25*SEC), 1, my_shoot_bullet_radius*0.5],
			[game_particle_setup_basic(my_invoke_color_1, 2.5, 0.35, 0.25*SEC), 2, my_shoot_bullet_radius*0.5]
		];
		break
		
	case 2:
		my_shoot_bullet_count = 1;
		my_shoot_bullet_range = 1800;
		my_shoot_bullet_speed = 1200*PPS;
		my_shoot_cast_value = 0.25*SEC;
		my_shoot_channel_value = 0.05*SEC;
		my_shoot_bullet_particles = [
			[game_particle_setup_basic(my_shoot_color, 1.75, 0.35, 0.25*SEC), 1, my_shoot_bullet_radius*0.5],
			[game_particle_setup_basic(my_invoke_color_2, 3, 0.35, 0.25*SEC), 2, my_shoot_bullet_radius*0.5]
		];
		break
}

if (ladysofia_action_shoot_set()){
	action_shoot[?"animation_cast"] = "channel_ranged";
	action_shoot[?"animation_channel"] = "attack_ranged";
	action_shoot[?"animation_backswing"] = "rest_ranged";
};