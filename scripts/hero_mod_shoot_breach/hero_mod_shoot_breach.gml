my_shoot_bullet_range *= 1.1;

my_shoot_poise_cost += 0.08;

action_shoot_bullet_seek_range *= 1.25;
action_shoot_bullet_seek_turn_rate *= 0.85;
action_shoot_bullet_collision_destroy_value += 1;

my_shoot_damage = [
	my_shoot_damage[0]*0.75,
	my_shoot_damage[1]*0.75,
];

my_shoot_flinch = [
	my_shoot_flinch[0]*0.75,
	my_shoot_flinch[1]*0.75,
];

hero_mod_shoot_apply();