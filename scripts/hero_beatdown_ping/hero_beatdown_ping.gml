var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var me = id;
hero_mod_shoot_ping();

var max_duration = 7.5*SEC;

var duration = 3.5*SEC;
var interval = 0.08*SEC;
	
var bullet_radius = 32;
var bullet_speed = 600*PPS;
var bullet_range = 1200;
var bullet_damage_factor = 0.2;
var bullet_seek = [540, 480*PPS, 360];
var bullet_extra = [1, false];
	
var bullet_type = my_shoot_bullet_type;
var bullet_color = my_shoot_flair_color;

var new_autofire = true;

for(var i = 0; i < ds_list_size(my_autofire_list);i++){
	var p = ds_list_find_value(my_autofire_list, i);
	var autofire_id = p[11]; 
	
	if (autofire_id == "ping_autofire"){
		new_autofire = false;		 
		p[0] = min(p[0] + duration,  max_duration);
		ds_list_replace(my_autofire_list, i, p);
	}
}

if (new_autofire){
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
		bullet_extra,
		"ping_autofire"
	])
}
