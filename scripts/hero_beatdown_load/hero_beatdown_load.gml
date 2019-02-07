var args = argument[0];
var base_target = args[0];
var base_value = args[1];


var bullet_radius = 64;
var bullet_speed = 1200*PPS;
var bullet_range = 1200;
var bullet_damage_factor = 0.25;

var explosion_radius = 720;
var explosion_damage_factor = 2.75;
var explosion_push = 120;

hero_mod_shoot_load();

var bullet_angle = angle_between(base_target.x,base_target.y,x,y);
var rad_angle = degtorad(bullet_angle);	
			
var spawn_x = (cos(rad_angle)*-150) + random_mirror(90);
var spawn_y = (sin(rad_angle)*-150) + random_mirror(90);
			
var bullet = hero_bullet_create([
	bullet_angle,
	bullet_radius,
	bullet_speed, 
	bullet_range,
	bullet_damage_factor,
	my_shoot_bullet_type,
	my_shoot_color,
	false,
	spawn_x, 
	spawn_y
]);
	
bullet.bullet_seek_range = INFINITY;
bullet.bullet_seek_turn_rate = 360*PPS;
bullet.bullet_seek_angle_limit = 360;
bullet.bullet_seek_target = base_target;
		
bullet.bullet_death_spawn[?"explosion_radius_max"] = explosion_radius;
bullet.bullet_death_spawn[?"explosion_lifespan_base"] = explosion_radius/(420*PPS);
bullet.bullet_death_spawn[?"explosion_lifespan_current"] = explosion_radius/(420*PPS);;
bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = my_shoot_color;
bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
bullet.bullet_death_spawn[?"status_immortal"] = true;
	
bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
	["damage", "actor", status_damage_total*explosion_damage_factor, true, "main_attack"],
	["push", "actor", explosion_push, 0.5*SEC, "center", ["multiply",1.5]],
]

hero_beatdown_bullet_sfx(bullet, my_shoot_color, bullet_radius)