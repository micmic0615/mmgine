my_shoot_cast_value *= 2;

my_shoot_poise_cost += 0.07;
my_shoot_recoil_range *= 1.1;

my_shoot_damage = [
	my_shoot_damage[0]*1.35,
	my_shoot_damage[1]*1.15
];

my_shoot_flinch = [
	my_shoot_flinch[0]*1.65,
	my_shoot_flinch[1]*1.5
];

action_shoot_bullet_seek_range *= 1.35;
action_shoot_bullet_seek_turn_rate *= 1.2;


hero_mod_shoot_apply();