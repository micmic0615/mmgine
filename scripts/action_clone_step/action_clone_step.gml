if (!actor_clone_active){
	if (actor_clone_original){
		var clone_number = actor_clone_count;
		while(clone_number > 0){actor_clone_spread_distance_max += sqr(actor_clone_spread_distance_min * 1.5); clone_number--}
		actor_clone_spread_distance_max = sqrt(actor_clone_spread_distance_max);

		clone_number = actor_clone_count;
		while(clone_number > 0){
		
			var spawned_actor = room_spawn_random_from_main_actor(object_index);
			spawned_actor.actor_clone_original = false;
			spawned_actor.actor_clone_parent = id;
			spawned_actor.x = x + random_mirror(actor_clone_spread_distance_max);
			spawned_actor.y = y + random_mirror(actor_clone_spread_distance_max);
			spawned_actor.physics_loop_enabled = false;
			ds_list_add(actor_clone_children, spawned_actor);
			ds_list_add(actor_clone_family, spawned_actor);
			clone_number--
		};
		x += random_mirror(actor_clone_spread_distance_max);
		y += random_mirror(actor_clone_spread_distance_max);
	} else {
		var main = actor_clone_parent;
		ds_list_clear(actor_clone_family);
		ds_list_copy(actor_clone_family, main.actor_clone_family);
		
		actor_clone_count = main.actor_clone_count;
		actor_clone_spread_distance_max = main.actor_clone_spread_distance_max;
	}

	actor_clone_active = true;
} else {
	if (actor_clone_original){
		for(var i = 0; i < ds_list_size(actor_clone_children);i++){
			var p = ds_list_find_value(actor_clone_children, i);
			p.status_health_current = status_health_current;
			p.status_poise_current = status_poise_current;
			
			if (distance_between(p.x,p.y,x,y) > actor_clone_spread_distance_max){
				actor_clone_spread_cooldown_timer = actor_clone_spread_cooldown_value;
				var me = id;
				with(p){
					entity_motion_push(actor_clone_spread_distance_min/2, 0.5*SEC, angle_between(me.x,me.y,x,y));
				}
			}
		};
	} else {
		if(actor_clone_parent.status_immortal){
			actor_buff_apply("immortal", 1, [])
		}
	}
	
	if (actor_clone_spread_cooldown_timer <= 0){
		for(var i = 0; i < ds_list_size(actor_clone_family);i++){
			var p = ds_list_find_value(actor_clone_family, i);
			if (p != id){
				if (distance_between(x,y,p.x,p.y) < actor_clone_spread_distance_min){	
					actor_clone_spread_cooldown_timer = actor_clone_spread_cooldown_value;
					entity_motion_push(actor_clone_spread_distance_min/2, 0.5*SEC, angle_between(x, y, p.x, p.y));
				}
			}
		};
	} else {
		actor_clone_spread_cooldown_timer -= TIMESPEED
	}
}

