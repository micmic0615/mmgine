var bullet = argument0;
var bullet_color = argument1;
var bullet_radius = argument2

bullet.animation_sprite = "HeroBulletClear";
ds_list_add(
	bullet.draw_particle_list, 
	[game_particle_setup_basic(bullet_color, 2 + random(4*(bullet_radius/64)), 0.5, 0.15*SEC, pt_shape_spark), ceil(8*(bullet_radius/64)), bullet_radius*0.5]
);

ds_list_add(
	bullet.draw_particle_list, 
	[game_particle_setup_basic(c_white, 3 + random(3*(bullet_radius/64)), 0.3, 0.1*SEC, pt_shape_flare), ceil(6*(bullet_radius/64)), bullet_radius*0.25]
);