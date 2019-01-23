my_shoot_bullet_speed *= 0.5;
my_shoot_bullet_range *= 0.7;
my_shoot_bullet_explosion += 130;

my_shoot_poise_cost += 0.05;

my_shoot_damage = [
	my_shoot_damage[0]*0.65,
	my_shoot_damage[1]*1.75,
];

my_shoot_flinch = [
	my_shoot_flinch[0]*1.25,
	my_shoot_flinch[1]*0.75
];

my_shoot_push = [
	abs(my_shoot_push[0]*1)*-1,
	abs(my_shoot_push[1]*2.25)*-1,
];

action_shoot_bullet_seek_range *= 0.65;
action_shoot_flag_explode_trigger = "always";

hero_mod_shoot_apply();