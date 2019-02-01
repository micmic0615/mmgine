if (!my_clone_active){
	if (my_clone_original){
		var clone_number = my_clone_count;
		while(clone_number > 0){my_clone_spread_distance_max += sqr(my_clone_spread_distance_min * 1.5); clone_number--}
		my_clone_spread_distance_max = sqrt(my_clone_spread_distance_max);

		clone_number = my_clone_count;
		while(clone_number > 0){
			var spawned_actor = room_spawn_random_from_main_actor(object_index);
			spawned_actor.my_clone_original = false;
			spawned_actor.my_clone_parent = id;
			spawned_actor.x = x + random_mirror(my_clone_spread_distance_max);
			spawned_actor.y = y + random_mirror(my_clone_spread_distance_max);
			spawned_actor.physics_loop_enabled = false;
			ds_list_add(my_clone_children, spawned_actor);
			ds_list_add(my_clone_family, spawned_actor);
			clone_number--
		};
		x += random_mirror(my_clone_spread_distance_max);
		y += random_mirror(my_clone_spread_distance_max);
	} else {
		var main = my_clone_parent;
		ds_list_clear(my_clone_family);
		ds_list_copy(my_clone_family, main.my_clone_family);
		
		my_clone_count = main.my_clone_count;
		my_clone_spread_distance_max = main.my_clone_spread_distance_max;
	}

	my_clone_active = true;
}

