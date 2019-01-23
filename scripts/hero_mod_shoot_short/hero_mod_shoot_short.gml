my_shoot_combo_max -= 1;
my_shoot_poise_cost += 0.01;

my_shoot_damage = [
	my_shoot_damage[0]*1.25,
	my_shoot_damage[1]*0.75
];

action_shoot_bullet_seek_range *= 1.15;
action_shoot_bullet_seek_turn_rate *= 1.1;

hero_mod_shoot_apply();