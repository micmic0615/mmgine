var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var bullet_count = 0;
var bullet_max = 3;

var bullet_speed = 540*PPS;
var bullet_damage_factor = 0.65;
	
if (ROOM.player_main_actor == id){		
	actor_buff_apply("untimed", 0.5*SEC, [], "untimed");
	room_timespeed_temp(0.05, 0.5*SEC, true)
}

entity_sfx_create_pulse(
	/*sprite*/ ExplosionBulletAlt_idle,
	/*duration*/ 0.5*SEC*TIMESPEED,
	/*blend*/ my_shoot_flair_color,
	/*style_data*/ [
		30,
		180,
		1
	]
)

while(bullet_count < bullet_max){
	var super_angle = angle_between(x,y,base_target.x,base_target.y) + random(120) - 60;
	var rad_angle = degtorad(super_angle);
	var mirage_flip = (super_angle <= 90 && super_angle >= 0) || (super_angle <= 360 && super_angle >= 270)
	var mirage_angle = mirage_flip ? point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) : point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) - 180;
	var mirage_direction = mirage_flip ? 1 : -1;
			
	var spawn_x = random(140) - 70;
	var spawn_y = random(140) - 70;
			
	var bullet = actor_spawn_bullet(spawn_x, spawn_y, x + spawn_x, y + spawn_y,my_shoot_bullet_type[0]);
	var bullet_angle = super_angle;
	bullet.status_movespeed_base = bullet_speed
	bullet.status_movesnap_base = 0.2*SEC;
	bullet.bullet_action_move_angle = bullet_angle;
		
	var rad_bullet_angle = degtorad(bullet.bullet_action_move_angle);
	bullet.animation_angle = point_direction(x,y,cos(rad_bullet_angle)*10 + x, sin(rad_bullet_angle)*10 + y)
	
	bullet.physics_gravity_on = false;
	bullet.collision_enabled_bullets = false;
	
	bullet.image_xscale = 0.65;
	bullet.image_yscale = 0.65;
				
	bullet.bullet_lifespan = 1*SEC;
	bullet.bullet_collision_tile_action = "die";
				
	bullet.bullet_death_spawn[?"explosion_radius_max"] = 50;
	bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
	bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = my_shoot_flair_color;
				
	var bullet_damage_value = status_damage_total * bullet_damage_factor;
	bullet.bullet_seek_range = INFINITY;
	bullet.bullet_seek_turn_rate = 360*PPS;
	bullet.bullet_seek_angle_limit = 360;
	bullet.bullet_seek_target = base_target;
		
	bullet.animation_sprite = my_shoot_bullet_type[1];
	entity_mirage_create(1*SEC, spawn_x, spawn_y, my_shoot_flair_color, mirage_angle, mirage_direction, Hero_attack);
			
	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", bullet_damage_value, true, "beatdown_attack"]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
				
	bullet_count++;
}