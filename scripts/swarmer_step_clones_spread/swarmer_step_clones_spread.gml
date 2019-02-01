if (my_clone_active){
	if (!my_clone_original){
		if (my_clone_parent.physics_loop_x != 0){
			x += my_clone_parent.physics_loop_x
		}
		
		if (my_clone_parent.physics_loop_y != 0){
			y += my_clone_parent.physics_loop_y
		}
	};
	
	if (my_clone_spread_cooldown_timer <= 0){
		for(var i = 0; i < ds_list_size(my_clone_family);i++){
			var p = ds_list_find_value(my_clone_family, i);
			if (p != id){
				if (distance_between(x,y,p.x,p.y) < my_clone_spread_distance_min){	
					my_clone_spread_cooldown_timer = my_clone_spread_cooldown_value;
					entity_motion_push(my_clone_spread_distance_min/2, 0.5*SEC, angle_between(x, y, p.x, p.y));
				}
			}
		};
	} else {
		my_clone_spread_cooldown_timer -= TIMESPEED
	}
}