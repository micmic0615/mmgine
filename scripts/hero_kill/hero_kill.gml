var target = argument0;
if (target.entity_class_lower == "actor"){
	var bullet = actor_spawn_bullet(x, y, x,y,ExplosionBullet);
	
	bullet.animation_sprite = "ExplosionBulletAlt";
	bullet.status_movespeed_base = 0;
	bullet.bullet_origin_anchor = true;
							
	bullet.status_health_max = INFINITY;
	bullet.status_health_current = bullet.status_health_max;
	bullet.bullet_action_move_angle = 0;
	
	bullet.physics_gravity_on = false;
	bullet.explosion_lifespan_base = 0.075*SEC;			
	bullet.explosion_lifespan_current = bullet.explosion_lifespan_base;			
	bullet.explosion_radius_min = 30;
	bullet.explosion_radius_max = 160;
	bullet.collision_compute = false;
	bullet.collision_enabled_actors = false;
	bullet.collision_enabled_bullets = false;
	bullet.collision_enabled_doodads = false;
		
	bullet.draw_blend_temporary_color = make_color_rgb(255,0,255);
	bullet.draw_blend_temporary_duration = INFINITY;
							
	bullet.bullet_death_spawn[?"type"] = noone;
		
	my_attack_super_duration += 2*SEC;
	my_attack_super_target_angle = undefined;
} else if (target.entity_class_lower == "bullet"){
	my_attack_super_duration += target.status_health_max > 1 ? 0.5*SEC : 0;
	my_attack_super_target_angle = undefined;
}
