var pulse_damage_factor = argument0;
var pulse_radius = argument1;
var pulse_push = argument2;

var bullet = actor_spawn_bullet(x, y, x,y,ExplosionBullet);
	
bullet.animation_sprite = "ExplosionBulletAlt";
bullet.status_movespeed_base = 0;
bullet.status_movesnap_base = 0.2*SEC;
							
bullet.status_health_max = INFINITY;
bullet.status_health_current = bullet.status_health_max;
bullet.bullet_action_move_angle = 0;
	
bullet.physics_gravity_on = false;
bullet.explosion_lifespan_base = 0.25*SEC;			
bullet.explosion_lifespan_current = bullet.explosion_lifespan_base;			
bullet.explosion_radius_min = 60;
bullet.explosion_radius_max = pulse_radius;
			
ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*pulse_damage_factor, true]);
ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", pulse_push , 2*SEC, "center", ["multiply",1.5]]);
							
bullet.bullet_death_spawn[?"type"] = noone;