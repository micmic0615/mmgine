var args = argument[0];
var me = id;

var base_target = args[0];
var base_value = args[1];
if (base_target.status_poise_current <= 0 && base_target.status_health_current > 0){
	var bullet = actor_spawn_bullet(x, y, x,y,ExplosionBullet);
	
	bullet.animation_sprite = "ExplosionBulletAlt";
	bullet.status_movespeed_base = 0;
	bullet.bullet_origin_anchor = true;
							
	bullet.status_health_max = INFINITY;
	bullet.status_health_current = bullet.status_health_max;
	bullet.bullet_action_move_angle = 0;
	
	bullet.physics_gravity_on = false;
	bullet.explosion_lifespan_base = 0.3*SEC;			
	bullet.explosion_lifespan_current = bullet.explosion_lifespan_base;			
	bullet.explosion_radius_min = 30;
	bullet.explosion_radius_max = 120;
	bullet.collision_compute = false;
	bullet.collision_enabled_actors = false;
	bullet.collision_enabled_bullets = false;
	bullet.collision_enabled_doodads = false;
		
	bullet.draw_blend_temporary_color = make_color_rgb(255,125,0);
	bullet.draw_blend_temporary_duration = INFINITY;
							
	bullet.bullet_death_spawn[?"type"] = noone;
	
	if (ROOM.player_main_actor == id){room_timespeed_temp(0.05, 0.2*SEC, true)}
	var bullet_count = 0;
	var bullet_max = my_attack_beatdown_bullet_count;
			
	while(bullet_count < bullet_max){
		var super_angle = angle_between(x,y,base_target.x,base_target.y) + random(120) - 60;
		var rad_angle = degtorad(super_angle);
		var mirage_flip = (super_angle <= 90 && super_angle >= 0) || (super_angle <= 360 && super_angle >= 270)
		var mirage_angle = mirage_flip ? point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) : point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) - 180;
		var mirage_direction = mirage_flip ? 1 : -1;
			
		var spawn_x = random(140) - 70;
		var spawn_y = random(140) - 70;
			
		var bullet = actor_spawn_bullet(spawn_x, spawn_y, x + spawn_x, y + spawn_y,DefaultBullet);
		var bullet_angle = super_angle;
		var bullet_speed_factor = 1.5;
		bullet.status_movespeed_base = my_attack_bullet_speed * bullet_speed_factor;
		bullet.status_movesnap_base = 0.2*SEC;
		bullet.bullet_action_move_angle = bullet_angle;
		
		var rad_bullet_angle = degtorad(bullet.bullet_action_move_angle);
		bullet.animation_angle = point_direction(x,y,cos(rad_bullet_angle)*10 + x, sin(rad_bullet_angle)*10 + y)
	
		bullet.physics_gravity_on = false;
		bullet.collision_enabled_bullets = false;
	
		bullet.image_xscale = 0.65;
		bullet.image_yscale = 0.65;
		
				
		bullet.bullet_lifespan = (((((my_attack_bullet_range*PPS)/TIMESPEED)/my_attack_bullet_speed)*SEC) / bullet_speed_factor) * 1.25;
		bullet.bullet_collision_tile_action = "die";
		
				
		bullet.bullet_death_spawn[?"explosion_radius_max"] = 50;
		bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
		bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = make_color_rgb(255,125,0);
				
		var bullet_damage_value = status_damage_total * my_attack_beatdown_bullet_damage_factor;
		bullet.bullet_seek_range = INFINITY;
		bullet.bullet_seek_turn_rate = 360*PPS;
		bullet.bullet_seek_angle_limit = 360;
		bullet.bullet_seek_target = base_target;
		
		bullet.animation_sprite = "HeroBullet1";
		entity_mirage_create(1*SEC, spawn_x, spawn_y, make_color_rgb(255,125,0), mirage_angle, mirage_direction, Hero_attack);
			
		ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", bullet_damage_value, true]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
				
				
		bullet_count++;
	}
}