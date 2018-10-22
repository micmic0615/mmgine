#region //MOTION
	physics_motion_x = 0;
	physics_motion_y = 0;

	for(var i = 0; i < ds_list_size(physics_motion_list);i++){
		var p = ds_list_find_value(physics_motion_list, i);
	
		var motion_x = p[0];
		var motion_y = p[1];
		var motion_lifespan = p[2];
		var motion_decay = p[3];
		var motion_id = p[4];
	
		physics_motion_x += motion_x;
		physics_motion_y += motion_y;
	
		if (motion_lifespan < INFINITY){
			ds_list_replace(physics_motion_list, i, [
				motion_x,
				motion_y,
				motion_lifespan - 1,
				motion_decay,
				motion_id
			])
		}
	}

	for(var i = 0; i < ds_list_size(physics_motion_list);i++){
		var p = ds_list_find_value(physics_motion_list, i);
		var motion_lifespan = p[2];
	
		if (motion_lifespan <= 0){
			ds_list_delete(physics_motion_list, i);
		}
	}

	var movement_x = floor(physics_motion_x);
	var movement_y = floor(physics_motion_y);

	physics_motion_spill_x += (physics_motion_x - movement_x);
	physics_motion_spill_y += (physics_motion_y - movement_y);

	if (physics_motion_spill_x > 1){ physics_motion_spill_x -= 1; movement_x += 1; };
	if (physics_motion_spill_y > 1){ physics_motion_spill_y -= 1; movement_y += 1; };
#endregion

#region //COLLISION
	var collision_count = 0;
	var base_x = x;
	var base_y = y;
	x = base_x + movement_x;
	y = base_y + movement_y;
	
	if (collision_compute){
		
		if (collision_solid && collision_pushable){
			
			var phase_count = entity_collision_check(true);
			var phase_center = 0;
		
			if (phase_count > 0){
				var final_x_push = 0;
				var final_y_push = 0;
				
				for(var i = 0; i < phase_count;i++){
					var p = ds_list_find_value(collision_entities, i);
					
					var right_push = 0;
					var left_push = 0;
					var bottom_push = 0;
					var top_push = 0;
					
					var x_push = 0;
					var y_push = 0;
					
					var x_bias = 1;
					var y_bias = 1;
					
					while (place_meeting(x + x_bias,y,p)){x_bias += 1}					
					right_push = x_bias;
					
					x_bias = -1;
					
					while (place_meeting(x + x_bias,y,p)){x_bias -= 1}					
					left_push = x_bias;
					
					x_push = abs(right_push) > abs(left_push) ? left_push : right_push;
					
					while (place_meeting(x,(y + y_bias),p)){y_bias += 1}					
					bottom_push = y_bias;
					
					y_bias = -1;
					
					while (place_meeting(x,(y + y_bias),p)){y_bias -= 1}					
					top_push = y_bias;
					
					y_push = abs(bottom_push) > abs(top_push) ? top_push : bottom_push;
					
					if (abs(x_push) < abs(y_push)){
						if (sign(final_x_push) == sign(x_push)){
							final_x_push = abs(x_push) > abs(final_x_push) ? x_push : final_x_push;
						} else {
							final_x_push = final_x_push == 0 ? x_push : INFINITY
						}
					} else {
						if (sign(final_y_push) == sign(y_push)){
							final_y_push = abs(y_push) > abs(final_y_push) ? y_push : final_y_push;
						} else {
							final_y_push = final_y_push == 0 ? y_push : INFINITY
						}
					}
				}
				
				x = final_x_push != INFINITY ? x + final_x_push : base_x;
				y = final_y_push != INFINITY ? y + final_y_push : base_y;
			}
		}
	
		collision_count = entity_collision_check(false);
	}
		
#endregion


#region //SCRIPTS
	entity_run_scripts("step");

	if (collision_count > 0){entity_run_scripts("collide")}
#endregion

