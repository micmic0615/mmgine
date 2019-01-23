my_shoot_bullet_count += 2;

my_shoot_bullet_radius *= 0.8;
my_shoot_bullet_range *= 0.9;

my_shoot_poise_cost += 0.04;

my_shoot_damage = [
	my_shoot_damage[0]*0.65,
	my_shoot_damage[1]*0.65,
];

my_shoot_flinch = [
	my_shoot_flinch[0]*0.5,
	my_shoot_flinch[1]*0.5,
];

my_shoot_push = [
	my_shoot_push[0]*0.5,
	my_shoot_push[1]*0.5,
];

action_shoot_bullet_seek_range *= 0.85;
action_shoot_bullet_seek_turn_rate *= 0.85;

hero_mod_shoot_apply();