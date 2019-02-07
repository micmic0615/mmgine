var skip_set = (argument_count > 0) ? argument[0] : "";
hero_mod_shoot_do("skip"); 

my_shoot_color = make_color_rgb(255,0,255);
my_shoot_bullet_type = [DefaultBullet, "HeroBullet3"];
my_shoot_bullet_speed = 1400*PPS;
my_shoot_bullet_range = 780;
my_shoot_bullet_radius = 36;
//my_shoot_bullet_count = 1;
//my_shoot_particles = [];
//my_shoot_bullet_impact_health = 1;
my_shoot_bullet_explosion_radius = 40;
//my_shoot_bullet_explosion_trigger = "death";
//my_shoot_bullet_chaos_speed = 0;
//my_shoot_bullet_chaos_range = 0;
my_shoot_bullet_chaos_angle = 24;
//my_shoot_bullet_angle_spread = 60;
my_shoot_bullet_seek_range = 300;
my_shoot_bullet_seek_turn_rate = 240*PPS;
//my_shoot_bullet_seek_angle_limit = 160;
//my_shoot_bullet_tile_phase = false;
my_shoot_damage = [0.5,0.1];
my_shoot_flinch = [0.1,0];
my_shoot_push = [15, 0];
my_shoot_fire_recoil = 30;

//my_shoot_combo_max = INFINITY;

my_shoot_cast_value = 1;
my_shoot_channel_value = 9;
my_shoot_backswing_value = 1;
my_shoot_cooldown_value = 0*SEC;

//my_shoot_poise_cost = 0;

//my_charge_factor_size = 1;
//my_charge_factor_speed = 1;
//my_charge_factor_range = 1;
//my_charge_factor_damage = 2;
//my_charge_factor_flinch = 4;
//my_charge_factor_explosion = 1;

//my_charge_divider_cast = 1;
//my_charge_divider_channel = 1;

if (skip_set != "skip"){hero_skill_set_shoot_mod_apply()};