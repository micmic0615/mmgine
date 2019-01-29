var pulse_damage_factor = argument0;
var pulse_flinch_factor = argument1;
var pulse_radius = argument2;
var pulse_push = argument3;

var bullet = actor_spawn_bullet(x, y, x,y,ExplosionBullet);
	
bullet.animation_sprite = "ExplosionBulletAlt";
bullet.status_movespeed_base = 0;
bullet.status_movesnap_base = 0.2*SEC;
							
bullet.status_health_max = INFINITY;
bullet.status_health_current = bullet.status_health_max;
bullet.bullet_action_move_angle = 0;
	
bullet.physics_gravity_on = false;
bullet.explosion_lifespan_base = pulse_radius/(360*PPS);	
bullet.explosion_lifespan_current = bullet.explosion_lifespan_base;		 	
bullet.explosion_radius_min = 60;
bullet.explosion_radius_max = pulse_radius;

bullet.bullet_origin_anchor = true;

bullet.collision_destroy_value_max = INFINITY;
bullet.collision_destroy_value_current = bullet.collision_destroy_value_max;
		
ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*pulse_damage_factor, true]);
ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", status_flinch_total*pulse_flinch_factor, true]);
ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", pulse_push , 2*SEC, "center", ["multiply",1.5]]);
							
bullet.bullet_death_spawn[?"type"] = noone;

return bullet;

