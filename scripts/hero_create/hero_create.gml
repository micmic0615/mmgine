status_movespeed_base = 600*PPS;
status_movesnap_base = 0.6*SEC;

status_health_max = 200;
status_damage_base = 20;
status_poise_max = 50;
status_poise_regen = 7*PPS;
status_flinch_duration = 2*SEC;

draw_bar_health_xscale = 0.5;
draw_bar_health_y = 30;

collision_persistent = true; 

player_faction = 0;

my_shoot_bullet_radius = 64;
my_shoot_bullet_speed = 800*PPS;
my_shoot_bullet_explosion = 60;
my_shoot_poise_cost = 0.9;

action_shoot_create([
	/*bullet_type*/ DefaultBullet,
	/*bullet_radius*/ my_shoot_bullet_radius,
	/*bullet_speed*/ my_shoot_bullet_speed,
	/*bullet_range*/ 800,
	/*bullet_explosion*/ my_shoot_bullet_explosion,
	/*recoil_speed*/ 420*PPS,
	/*recoil_range*/ 120,
	/*cast_value*/ 0.1*SEC,
	/*channel_value*/ 0.15*SEC,
	/*backswing_value*/ 1*SEC,
	/*cooldown_value*/ 0.05*SEC,
	/*combo_max*/ 1
]);

my_dash_speed = 540*PPS;
my_dash_range = 360;
my_dash_charge_cost = 0.35*SEC;

action_dash_create([
	/*speed*/ my_dash_speed,
	/*range*/ my_dash_range,
	/*channel_value*/ 0.2*SEC,
	/*cooldown_value*/ 0*SEC,
	/*cooldown_rest*/ 0.75*SEC,
	/*combo_max*/ 2
]);

my_charge_current = 0;
my_charge_min = 1*SEC;
my_charge_max = 4*SEC;
my_charge_bonus_factor_size = 1.5;
my_charge_bonus_factor_speed = 1;