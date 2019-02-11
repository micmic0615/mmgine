var bullet_angle = argument0[0];
var bullet_radius = argument0[1];
var bullet_speed = argument0[2];
var bullet_range = argument0[3];
var bullet_damage_factor = argument0[4];
var bullet_type = argument0[5];
var bullet_color = argument0[6];
var bullet_should_push = argument0[7];

var spawn_x = argument0[8];
var spawn_y = argument0[9];

var mirage_spawn = array_length_1d(argument0) > 10 ? argument0[10] : true;



var rad_angle = degtorad(bullet_angle);	

var bullet = actor_spawn_bullet(spawn_x, spawn_y, x + spawn_x, y + spawn_y, bullet_type[0]);
bullet.status_movespeed_base = bullet_speed
bullet.status_movesnap_base = 0.2*SEC;
bullet.bullet_action_move_angle = bullet_angle;

bullet.x += cos(rad_angle)*30;
bullet.y += sin(rad_angle)*30;
		
var rad_bullet_angle = degtorad(bullet.bullet_action_move_angle);
bullet.animation_angle = point_direction(x,y,cos(rad_bullet_angle)*10 + x, sin(rad_bullet_angle)*10 + y);

bullet.physics_gravity_on = false;
bullet.collision_enabled_bullets = false;

bullet.image_xscale = (bullet_radius*2)/sprite_get_width(sprite_index);
bullet.image_yscale = (bullet_radius*2)/sprite_get_width(sprite_index);

if (bullet_should_push){
	bullet.bullet_lifespan = (bullet_range*0.75)/bullet_speed
} else {
	bullet.bullet_lifespan = bullet_range/bullet_speed
}

bullet.bullet_collision_tile_action = "die";

bullet.bullet_death_spawn[?"explosion_radius_max"] = 50;
bullet.bullet_death_spawn[?"draw_blend_permanent_color"] = bullet_color;

var bullet_damage_value = status_damage_total * bullet_damage_factor;

bullet.animation_sprite = bullet_type[1];
			
ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", bullet_damage_value, true, "beatdown_attack"]);

if (bullet_should_push){
	with(bullet){
		entity_motion_push(bullet_range*0.25, 0.5*SEC, bullet_angle, ["multiply",1.25], "bullet_push");
	}
}


if (mirage_spawn){
	hero_mirage_create(1.5*SEC, bullet_angle, bullet_color, spawn_x, spawn_y);
}


return bullet