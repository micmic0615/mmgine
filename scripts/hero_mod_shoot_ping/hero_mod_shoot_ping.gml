my_shoot_cast_value *= 0.65;
my_shoot_channel_value *= 0.65;
my_shoot_cooldown_value *= 0.65;

my_shoot_bullet_range *= 0.95;
my_shoot_bullet_speed *= 0.85;
my_shoot_bullet_radius *= 0.9;
my_shoot_bullet_explosion -= 15;

my_shoot_recoil_range *= 0.75;

my_shoot_damage = [
	my_shoot_damage[0]*0.8,
	my_shoot_damage[1]*0.8,
];

my_shoot_flinch = [
	my_shoot_flinch[0]*0.6,
	my_shoot_flinch[1]*0.6,
];

hero_mod_shoot_apply();