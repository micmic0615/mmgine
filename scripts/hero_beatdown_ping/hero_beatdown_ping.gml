var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var me = id;
hero_mod_shoot_ping();

var duration = 4*SEC;
var interval = 0.1*SEC;
	
var bullet_radius = 32;
var bullet_speed = 600*PPS;
var bullet_range = 1200;
var bullet_damage_factor = 0.15;
var bullet_seek = [540, 480*PPS, 360];
var bullet_extra = [1, false];
	
var bullet_type = my_shoot_bullet_type;
var bullet_color = my_shoot_flair_color;

ds_list_add(my_autofire_list, [
	duration,
	noone,
	interval,
	bullet_radius,
	bullet_speed,
	bullet_range,
	bullet_damage_factor,
	bullet_type,
	bullet_color,
	bullet_seek,
	bullet_extra
])