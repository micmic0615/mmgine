status_movespeed_base = 600*PPS;
status_movesnap_base = 0.6*SEC;

status_health_max = 100;
status_damage_base = 20;
status_flinch_base = 20;
status_poise_max = 100;
status_poise_regen = 17*PPS;
status_flinch_duration = 2*SEC;

draw_bar_health_xscale = 0.5;
draw_bar_health_y = 30;

collision_persistent = true; 

player_faction = 0;

my_shoot_bullet_radius = 64;
my_shoot_bullet_speed = 1200*PPS;
my_shoot_bullet_range = 800;
my_shoot_bullet_count = 1;
my_shoot_bullet_explosion = 120;
my_shoot_poise_cost = 0.1;

my_shoot_recoil_range = 90;
my_shoot_flair_color = make_color_rgb(255,0,200);

my_shoot_combo_max = 5;
my_shoot_cast_value = 0.1*SEC;
my_shoot_channel_value = 0.15*SEC;
my_shoot_cooldown_value = 0.05*SEC;

my_shoot_damage = [1,0.2];
my_shoot_flinch = [1,0.2];
my_shoot_push = [100, 10];



action_shoot_create([
	/*bullet_type*/ [DefaultBullet, "HeroBullet4"],
	/*bullet_radius*/ my_shoot_bullet_radius,
	/*bullet_speed*/ my_shoot_bullet_speed,
	/*bullet_range*/ my_shoot_bullet_range,
	/*bullet_count*/ my_shoot_bullet_count,
	/*bullet_explosion*/ my_shoot_bullet_explosion,
	/*recoil_speed*/ 420*PPS,
	/*recoil_range*/ my_shoot_recoil_range,
	/*cast_value*/ my_shoot_cast_value,
	/*channel_value*/ my_shoot_channel_value,
	/*backswing_value*/ 1*SEC,
	/*cooldown_value*/ my_shoot_cooldown_value,
	/*combo_max*/ my_shoot_combo_max,
	/*damage*/ my_shoot_damage,
	/*flinch*/ my_shoot_flinch,
	/*push*/ my_shoot_push,
	/*flair_color*/ my_shoot_flair_color,
]);

hero_mod_shoot_split();
hero_mod_shoot_split();
hero_mod_shoot_split();
hero_mod_shoot_crash();
hero_mod_shoot_crash();
hero_mod_shoot_crash();

my_dash_speed = 540*PPS;
my_dash_range = 360;
my_dash_charge_cost = 0.35*SEC;

my_dash_flair_color = make_color_rgb(0,255,255);

action_dash_create([
	/*speed*/ my_dash_speed,
	/*range*/ my_dash_range,
	/*channel_value*/ 0.2*SEC,
	/*cooldown_value*/ 0*SEC,
	/*cooldown_rest*/ 0.75*SEC,
	/*combo_max*/ 2,
	/*flair_color*/ my_dash_flair_color
]);

my_charge_current = 0;
my_charge_min = 1*SEC;
my_charge_max = 3*SEC;
my_charge_factor_size = 3;
my_charge_factor_speed = 2;
my_charge_factor_damage = 2;
my_charge_factor_flinch = 5;



