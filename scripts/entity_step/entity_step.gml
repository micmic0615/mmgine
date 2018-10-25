if (ACTIVE && ALIVE){
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
				i--;
			}
		}

		var movement_x = floor(physics_motion_x);
		var movement_y = floor(physics_motion_y);
		
		

		physics_motion_spill_x += (physics_motion_x - movement_x);
		physics_motion_spill_y += (physics_motion_y - movement_y);
		
		
		
		
		
		if (abs(physics_motion_spill_x) > 1){ physics_motion_spill_x -= sign(physics_motion_spill_x); movement_x += sign(physics_motion_spill_x)};
		if (physics_motion_spill_y > 1){ physics_motion_spill_y -= 1; movement_y += 1; };
	#endregion

	#region //COLLISION
		var collision_count_entities = 0;
		var collision_count_tiles = 0;
		var base_x = x;
		var base_y = y;
		
		x = base_x + movement_x;
		y = base_y + movement_y;
		
		var final_x_push = 0;
		var final_y_push = 0;
	
		if (collision_compute){
			if (collision_solid ){
				if (collision_pushable){
					var phase_count = entity_collision_check_entity(true);
					if (phase_count > 0){
						for(var i = 0; i < phase_count;i++){
							var p = ds_list_find_value(collision_entities, i);
							if (
								(physics_motion_x != 0 || physics_motion_y != 0) || 
								(p.physics_motion_x != 0 || p.physics_motion_y != 0)
							){
								var push_replacer = entity_collision_compute_push(p, final_x_push, final_y_push);
			
								final_x_push = push_replacer[0];
								final_y_push = push_replacer[1];
							}
						}
					}
				}
				
				
				collision_count_tiles = entity_collision_check_tile(true);
				for(var i = 0; i < collision_count_tiles;i++){
					var p = ds_list_find_value(collision_tiles, i);
					
					var push_replacer = entity_collision_compute_push(p, final_x_push, final_y_push);
					
					final_x_push = push_replacer[0];
					final_y_push = push_replacer[1];
				}
			
				x = final_x_push != INFINITY ? x + final_x_push : base_x;
				y = final_y_push != INFINITY ? y + final_y_push : base_y;
			}
	
			collision_count_entities = entity_collision_check_entity(false);
		}
	#endregion

	#region //SCRIPTS
		entity_run_class_scripts("step");
		if (collision_count_entities > 0 || collision_count_tiles > 0){			
			collision_contact_y = "none";
			if (sign(final_y_push) < 0){collision_contact_y = "top"}
			else if (sign(final_y_push) > 0){collision_contact_y = "bottom"}	
			
			collision_contact_x = "none";
			if (sign(final_x_push) < 0){collision_contact_x = "right"}
			else if (sign(final_x_push) > 0){collision_contact_x = "left"}
			
			if (collision_count_entities > 0){entity_run_class_scripts("collide")}
			if (collision_count_tiles > 0){entity_run_class_scripts("collide_tile")}
		}
		
	#endregion
	
	if (ACTIVE && ALIVE){
		#region //MOVE
			status_movesnap_total = status_movesnap_base;
			status_movespeed_total = status_movespeed_base;
			var list_length = ds_list_size(status_move_angle_list);
			for(var i = 0; i < list_length;i++){
				var angle = ds_list_find_value(status_move_angle_list, i);
				var rad_angle = degtorad(angle)
				var speed_factor = (status_movespeed_total/list_length)/status_movesnap_total;
				var move_x = cos(rad_angle)*speed_factor;
				var move_y = sin(rad_angle)*speed_factor;
				entity_add_motion(move_x, move_y, status_movesnap_total);
			}

			ds_list_clear(status_move_angle_list);
		#endregion
	}
} else {
	if (ALIVE){
		ROOM = instance_find(ROOM_OBJECT, 0);
		ACTIVE = true;
	} else {
		instance_destroy(id, false);	
	}
}