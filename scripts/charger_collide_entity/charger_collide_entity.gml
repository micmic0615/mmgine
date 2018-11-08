if (ACTIVE && ALIVE){
	var me = id;
	
	//for(var i = 0; i < ds_list_size(collision_entities_connect);i++){
	//	var p = ds_list_find_value(collision_entities_connect, i);
	//	if (p.entity_class_lower == "actor"){
	//		ds_list_add(collision_entities_exceptions, p);
	//	}
	//}
	
	if (my_attack_cast_timer > 0 && my_attack_collide_cooldown_timer <= 0){
		var push_self = true;
		var connect_length = ds_list_size(collision_entities_connect);
		for(var i = 0; i < connect_length;i++){
			var p = ds_list_find_value(collision_entities_connect, i);
		
			if (p.entity_class_lower == "actor" && p.player_faction != player_faction){	
				with(p){
					if (ACTIVE && ALIVE){
						var duration = 1*SEC;
						var rad_angle = degtorad(angle_between(x,y, me.x, me.y))
						var x_move = (cos(rad_angle) * me.my_attack_push_distance)/duration;
						var y_move = (sin(rad_angle) * me.my_attack_push_distance)/duration;
						entity_motion_add(x_move, y_move, duration, ["multiply",1.5])
						
						with(me){
							var dash_duration = 2*SEC*connect_length;
							var x_dash = (cos(rad_angle) * me.my_attack_dash_distance)/dash_duration;
							var y_dash = (sin(rad_angle) * me.my_attack_dash_distance)/dash_duration;
							entity_motion_add(x_dash, y_dash, dash_duration, ["multiply",1.1]);
							
							var bullet = actor_spawn_bullet(p.x, p.y, p.x,p.y,ExplosionBullet);

							bullet.status_movespeed_base = 0;
							bullet.status_movesnap_base = 0.2*SEC;
							
							bullet.status_health_max = INFINITY;
							bullet.status_health_current = bullet.status_health_max;
							bullet.bullet_action_move_angle = 0;
	
							bullet.physics_gravity_on = false;
							
							bullet.explosion_radius_min = 40;
							bullet.explosion_radius_max = 160;
							
							bullet.draw_blend_temporary_color = animation_sprite == "Charger" ? make_color_rgb(255,0,0) : make_color_rgb(255,255,0);
							bullet.draw_blend_temporary_duration = INFINITY;
							
							bullet.bullet_death_spawn[?"type"] = noone;
							bullet.bullet_lifespan = INFINITY;
							
							entity_damage_deal([p, status_damage_total, true]);
							
							actor_flinch_deal([p, status_damage_total*0.5])
						}
					}
				}
			}
		}
		
		my_attack_collide_cooldown_timer = my_attack_collide_cooldown_value;
	}
	
	
}