if (entity_enabled()){
	var motion_x = argument[0];
	var motion_y = argument[1];
	var motion_lifespan = argument[2];
	var motion_decay = (argument_count >= 4) ? argument[3] : ["none"];
	var motion_id = (argument_count == 5) ? argument[4] : undefined;

	var next_ratio = ((motion_lifespan-1)/motion_lifespan);

	var decay_ratio = (((motion_lifespan - 1)*0.5) + 1) + 0.5;

	switch(motion_decay[0]){
		case "linear":
			motion_x = motion_x*2 * next_ratio;
			motion_y = motion_y*2 * next_ratio;
			break
		
		case "multiply":
			var tick_add = 1;
			var tick_total = 0;
			var tick_count = motion_lifespan + 1;
			var tick_decay = motion_decay[1];
	
			while(tick_count > 0){
				tick_total += tick_add;
				tick_add /= tick_decay;
				tick_count--;
			}
		
			motion_x = motion_x*motion_lifespan/tick_total;
			motion_y = motion_y*motion_lifespan/tick_total;
			break
	
		case "none":
		default: 
			break
	}

	var motion_push = [
		motion_x,
		motion_y,
		motion_lifespan,
		motion_decay,
		motion_id
	];

	ds_list_add(physics_motion_list, motion_push)
}
