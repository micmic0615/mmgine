var target_point = argument0;

if (my_dash_cooldown_timer <= 0){	
	entity_motion_push((my_dash_range), (my_dash_speed/(my_dash_range*PPS))*SEC, angle_between(target_point[0], target_point[1], x, y),  ["multiply",1.25], "mana_dash");
	my_dash_cooldown_timer = my_dash_cooldown_value;
	
	var bullet = actor_spawn_bullet(x, y, x,y,ExplosionBullet);

	bullet.status_movespeed_base = 0;
	bullet.status_movesnap_base = 0.2*SEC;
							
	bullet.status_health_max = INFINITY;
	bullet.status_health_current = bullet.status_health_max;
	bullet.bullet_action_move_angle = 0;
	
	bullet.physics_gravity_on = false;
	bullet.explosion_lifespan_base = 0.25*SEC;			
	bullet.explosion_lifespan_current = bullet.explosion_lifespan_base;			
	bullet.explosion_radius_min = 10;
	bullet.explosion_radius_max = animation_sprite == "Charger" ? my_dash_range*1.5 : my_dash_range*0.75;
	bullet.draw_blend_temporary_color = animation_sprite == "Charger" ? make_color_rgb(255,0,0) : make_color_rgb(255,255,0);
	bullet.draw_blend_temporary_duration = INFINITY;
			
	if (my_attack_channel_ongoing > 0){
		ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*0.5, true]);
		ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", 200 , 1*SEC, "center", ["multiply",1.5]]);
	} 
							
	bullet.bullet_death_spawn[?"type"] = noone;
}