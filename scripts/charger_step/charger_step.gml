if (actor_actions_enabled){
	var floor_age = floor(ROOM.room_age_game);
	var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
			
	if (my_attack_cooldown_timer <=  0){
		if (my_attack_channel_ongoing > 0){
			physics_gravity_current = 0;
			animation_name = "channel";
			my_attack_channel_power_current = min(my_attack_channel_power_current + TIMESPEED, my_attack_channel_power_max);
			var power_ratio = (my_attack_channel_power_current/my_attack_channel_power_max);
			var power_quadroot = sqrt(sqrt(power_ratio));
			actor_buff_apply("movespeed_set_percent", 0.1*SEC, [100 - (power_quadroot*100)], "channel_slow");
			
			actor_buff_apply("armor_health", 0.1*SEC, [75], "mana_armor_health_2");
			actor_buff_apply("armor_poise", 0.1*SEC, [50], "mana_armor_poise_2");
		}
	} else {
		my_attack_cooldown_timer -= TIMESPEED;
		
		if (my_attack_cast_timer > 0){
			my_attack_cast_timer -= TIMESPEED;
			my_attack_collide_cooldown_timer -= TIMESPEED;
			animation_name = "attack";
			
			
			if (floor_age != next_floor_age && floor_age % (0.05*SEC) == 0){
				entity_mirage_create(0.4*SEC, 0, 0, make_color_rgb(225,0,0));
			}
		}
	}
	
	if (my_attack_channel_ongoing > 0){
		if (floor_age != next_floor_age && floor_age % (my_attack_channel_ongoing > 0 ? (0.25*SEC) : (0.05*SEC)) == 0){
			var bullet = actor_spawn_bullet(x, y, x,y,ExplosionBullet);

			bullet.status_movespeed_base = 0;
			bullet.status_movesnap_base = 0.2*SEC;
							
			bullet.status_health_max = INFINITY;
			bullet.status_health_current = bullet.status_health_max;
			bullet.bullet_action_move_angle = 0;
	
			bullet.physics_gravity_on = false;
			bullet.explosion_lifespan_base = my_attack_channel_ongoing > 0 ? (0.75*SEC) : (0.25*SEC);			
			bullet.explosion_lifespan_current = bullet.explosion_lifespan_base;			
			bullet.explosion_radius_min = 10;
			bullet.explosion_radius_max = my_attack_channel_ongoing > 0 ? 180 : 30;
			
			
			bullet.draw_blend_temporary_color = animation_sprite == "Charger" ? make_color_rgb(255,0,0) : make_color_rgb(255,255,0);
			bullet.draw_blend_temporary_duration = INFINITY;
			
			if (my_attack_channel_ongoing > 0){
				ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*0.2, true]);
				ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", 200 , 1*SEC, "center", ["multiply",1.5]]);
			} 
							
			bullet.bullet_death_spawn[?"type"] = noone;
		}
	}
	
	my_attack_channel_ongoing -= 1;
	my_dash_cooldown_timer -= TIMESPEED;
	
	if (my_clone_push_cooldown_timer > 0){
		my_clone_push_cooldown_timer -= TIMESPEED
	} else {
		var me = id;
		with(object_index){
			if (instance_exists(id) && id != me ){
				var distance = 60;
				if (distance_between(x,y,me.x,me.y) < distance){
					var duration = 0.25*SEC;
					var rad_angle = degtorad(angle_between(me.x, me.y,x,y))
					var x_move = (cos(rad_angle) * distance)/duration;
					var y_move = (sin(rad_angle) * distance)/duration;
					with(me){entity_motion_add(x_move, y_move, duration, ["multiply",1.5])};
					me.my_clone_push_cooldown_timer = my_clone_push_cooldown_value
				}
			}
		}
	}
} else {
	my_attack_cooldown_timer = 0;
	my_attack_channel_power_current = 0;
	my_attack_channel_ongoing = 0;
	my_attack_cast_timer = 0;
	
	my_attack_collide_cooldown_timer = 0;
}