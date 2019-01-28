var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var bullet_count = 0;
var bullet_max = 10;

var bullet_radius = 40;
var bullet_speed = status_movespeed_base*2;;
var bullet_range = 720;
var bullet_damage_factor = 0.3;

hero_mod_shoot_breach();
var spread_angle = 360;

while(bullet_count < bullet_max){
	var bullet_angle = angle_between(base_target.x,base_target.y,x,y) + ((spread_angle/bullet_max)*bullet_count) - (spread_angle*0.5);
	var rad_angle = degtorad(bullet_angle);	
			
	var spawn_x = cos(rad_angle)*180;
	var spawn_y = sin(rad_angle)*180;
			
	var bullet = hero_bullet_create([
		bullet_angle,
		bullet_radius,
		bullet_speed, 
		bullet_range,
		bullet_damage_factor,
		my_shoot_bullet_type,
		my_shoot_flair_color,
		spawn_x, 
		spawn_y
	]);
	
	bullet.bullet_seek_range = INFINITY;
	bullet.bullet_seek_turn_rate = status_movespeed_base*0.5;;
	bullet.bullet_seek_angle_limit = 360;
	bullet.bullet_seek_target = id;
	
	bullet.collision_destroy_value_max = 10;
	bullet.collision_destroy_value_current = bullet.collision_destroy_value_max;
	
	bullet.collision_enabled_bullets = true;
		
	bullet_count++;
}