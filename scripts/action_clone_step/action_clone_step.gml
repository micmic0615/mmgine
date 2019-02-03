if (!action_clone_active){
	if (action_clone_original){
		var clone_number = action_clone_count;
		while(clone_number > 0){action_clone_spread_distance_max += sqr(action_clone_spread_distance_min * 1.5); clone_number--}
		action_clone_spread_distance_max = sqrt(action_clone_spread_distance_max);

		clone_number = action_clone_count;
		while(clone_number > 0){
		
			var spawned_actor = room_spawn_random_from_main_actor(object_index);
			spawned_actor.action_clone_original = false;
			spawned_actor.action_clone_parent = id;
			spawned_actor.x = x + random_mirror(action_clone_spread_distance_max);
			spawned_actor.y = y + random_mirror(action_clone_spread_distance_max);
			spawned_actor.physics_loop_enabled = false;
			ds_list_add(action_clone_children, spawned_actor);
			ds_list_add(action_clone_family, spawned_actor);
			clone_number--
		};
		x += random_mirror(action_clone_spread_distance_max);
		y += random_mirror(action_clone_spread_distance_max);
	} else {
		var main = action_clone_parent;
		ds_list_clear(action_clone_family);
		ds_list_copy(action_clone_family, main.action_clone_family);
		
		action_clone_count = main.action_clone_count;
		action_clone_spread_distance_max = main.action_clone_spread_distance_max;
	}

	action_clone_active = true;
} else {
	if (action_clone_original){
		for(var i = 0; i < ds_list_size(action_clone_children);i++){
			var p = ds_list_find_value(action_clone_children, i);
			p.status_health_current = status_health_current;
			p.status_poise_current = status_poise_current;
			
			if (p.action_clone_spread_cooldown_timer <= 0){
				var distance_from_parent = distance_between(p.x,p.y,x,y);
				if (distance_from_parent > action_clone_spread_distance_max*3){
					p.x = x;
					p.y = y;
				} else if (distance_from_parent > action_clone_spread_distance_max){
					action_clone_spread_cooldown_timer = action_clone_spread_cooldown_value;
					var me = id;
					with(p){
						ds_list_clear(physics_motion_list);
						entity_motion_push(action_clone_spread_distance_min/2, 0.5*SEC, angle_between(me.x,me.y,x,y));
					}
				}
			}
		};
	} else {
		if(action_clone_parent.status_immortal){
			actor_buff_apply("immortal", 1, [])
		}
	}
	
	if (action_clone_spread_cooldown_timer <= 0){
		for(var i = 0; i < ds_list_size(action_clone_family);i++){
			var p = ds_list_find_value(action_clone_family, i);
			if (p != id){
				if (distance_between(x,y,p.x,p.y) < action_clone_spread_distance_min){	
					action_clone_spread_cooldown_timer = action_clone_spread_cooldown_value;
					entity_motion_push(action_clone_spread_distance_min/2, 0.5*SEC, angle_between(x, y, p.x, p.y));
				}
			}
		};
	} else {
		action_clone_spread_cooldown_timer -= TIMESPEED
	}
}

