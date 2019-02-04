var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var bullet_count = 0;
var bullet_max = 3;

var bullet_radius = 60;
var bullet_speed = 720*PPS;
var bullet_range = 720;
var bullet_damage_factor = 1.25;

hero_mod_shoot_do();

while(bullet_count < bullet_max){
	var bullet_angle = angle_between(x,y,base_target.x,base_target.y) + random(120) - 60;
	var rad_angle = degtorad(bullet_angle);	
			
	var spawn_x = random(140) - 70;
	var spawn_y = random(140) - 70;
			
	var bullet = hero_bullet_create([
		bullet_angle,
		bullet_radius,
		bullet_speed, 
		bullet_range,
		bullet_damage_factor,
		my_shoot_bullet_type,
		my_shoot_flair_color,
		true,
		spawn_x, 
		spawn_y
	]);
	
	
	bullet.bullet_seek_range = INFINITY;
	bullet.bullet_seek_turn_rate = 360*PPS;
	bullet.bullet_seek_angle_limit = 360;
	bullet.bullet_seek_target = base_target;
	
	hero_beatdown_bullet_sfx(bullet, my_shoot_flair_color, bullet_radius);
	
	
				
	bullet_count++;
}