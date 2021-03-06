var skip_set = (argument_count > 0) ? argument[0] : "";

my_shoot_color = make_color_rgb(0,255,255);
my_shoot_bullet_type = [DefaultBullet, "HeroBullet1"];
my_shoot_bullet_speed = 1000*PPS;
my_shoot_bullet_range = 740;
my_shoot_bullet_radius = 64;
my_shoot_bullet_count = 1;
my_shoot_particles = [];
my_shoot_bullet_impact_health = 1;
my_shoot_bullet_explosion_radius = 80;
my_shoot_bullet_explosion_trigger = "death";
my_shoot_bullet_chaos_speed = 0;
my_shoot_bullet_chaos_range = 0;
my_shoot_bullet_chaos_angle = 0;
my_shoot_bullet_angle_spread = 60;
my_shoot_bullet_seek_range = 240;
my_shoot_bullet_seek_turn_rate = 160*PPS;
my_shoot_bullet_seek_angle_limit = 160;
my_shoot_bullet_seek_no_decay = false;
my_shoot_bullet_tile_phase = false;
my_shoot_damage = [1,0.2];
my_shoot_flinch = [1,0];
my_shoot_push = [60, 10];
my_shoot_fire_recoil = 90;

my_shoot_combo_max = INFINITY;

my_shoot_cast_value = 0.1*SEC;
my_shoot_channel_value = 0.2*SEC;
my_shoot_backswing_value = 0.1*SEC;
my_shoot_cooldown_value = 0.05*SEC;

my_shoot_poise_cost = 0;

my_charge_factor_size = 1;
my_charge_factor_speed = 1;
my_charge_factor_range = 1;
my_charge_factor_damage = 2;
my_charge_factor_flinch = 4;
my_charge_factor_explosion = 1;

my_charge_divider_cast = 1;
my_charge_divider_channel = 1;

if (ROOM.player_main_actor != id){
	my_shoot_bullet_range = 840;
	my_shoot_bullet_radius = 54;
	
	my_shoot_bullet_seek_range = 280;
	my_shoot_bullet_seek_turn_rate = 200*PPS;
	my_shoot_bullet_seek_angle_limit = 180;
	
	my_charge_factor_damage = 2;
	my_charge_factor_flinch = 2.5;
	my_shoot_fire_recoil = 45;
	
	my_shoot_cast_value = 0.05*SEC;
	my_shoot_channel_value = 0.25*SEC;
	
	my_shoot_poise_cost = 0.35;
}

if (skip_set != "skip"){hero_skill_set_shoot_mod_apply()};
