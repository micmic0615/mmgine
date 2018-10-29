if (ACTIVE && ALIVE){
	#region //MOVE AND MOTION
		var list_length = ds_list_size(status_move_angle_list);
		
		for(var i = 0; i < list_length;i++){
			var angle = ds_list_find_value(status_move_angle_list, i);
			var rad_angle = degtorad(angle)
			var speed_factor = (status_movespeed_total/list_length)/status_movesnap_total;
			var move_x = cos(rad_angle)*speed_factor;
			var move_y = sin(rad_angle)*speed_factor;
			
			
			entity_add_motion(move_x, move_y, status_movesnap_total, ["linear"], "move_motion");
		}
			
		status_movesnap_total = max(2, status_movesnap_base);
		status_movespeed_total = status_movespeed_base;
			
		ds_list_clear(status_move_angle_list);

		physics_motion_x = 0;
		physics_motion_y = 0;
		
		var motion_list_length = ds_list_size(physics_motion_list);
		var move_x_total = 0;
		var move_y_total = 0;
		
		for(var i = 0; i < motion_list_length;i++){
			var p = ds_list_find_value(physics_motion_list, i);
	
			var motion_x = p[0];
			var motion_y = p[1];
			var motion_lifespan = p[2];
			var motion_decay = p[3];
			var motion_id = p[4];
	
			physics_motion_x += motion_x;
			physics_motion_y += motion_y;
			
			if (motion_id == "move_motion"){
				move_x_total += motion_x;
				move_y_total += motion_y;
			}
			
			switch(motion_decay[0]){
				case "linear":
					motion_x = (motion_x/motion_lifespan)*(motion_lifespan - 1);
					motion_y = (motion_y/motion_lifespan)*(motion_lifespan - 1);
					break
						
				case "multiply":
					motion_x /= motion_decay[1];
					motion_y /= motion_decay[1];
					break
					
				case "none":
				default:
					break;
			}
	
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
		
		if (abs(move_x_total) > 50*PPS || abs(move_y_total) > 50*PPS){
			animation_name = "walk";
			animation_direction = move_x_total != 0 ? sign(move_x_total) : animation_direction;
			animation_angle = point_direction(x,y,x+move_x_total,y+move_y_total);
			if (animation_direction == -1){animation_angle -= 180}
		} else {
			animation_angle = 0;
			animation_name = "idle";
		}
	#endregion

	#region //COLLISION
		var collision_count_entities = 0;
		var collision_count_tiles = 0;
		var base_x = x;
		var base_y = y;
		
		var final_x_push = 0;
		var final_y_push = 0;
		
		
		var move_steps_max = collision_persistent != true ? 1 : ((abs(movement_x) > abs(movement_y)) ? ceil(abs(movement_x) / sprite_width) :  ceil(abs(movement_y) / sprite_height));
		var move_steps_current = move_steps_max;
	
		while(move_steps_current > 0){
			base_x = x;
			base_y = y;
			
			x = base_x + movement_x/move_steps_max;
			y = base_y + movement_y/move_steps_max;
			
			move_steps_current--;
			
			if (collision_compute){
				if (collision_solid_entities){
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
				}
			
				collision_count_entities = entity_collision_check_entity(false);
			
				if (collision_solid_tiles){
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
			}
			
			if (
				(collision_count_tiles > 0 && collision_solid_tiles) ||
				(collision_count_entities > 0 && collision_solid_entities)
			){
				move_steps_current = 0;
			}
		}
	#endregion

	#region //SCRIPTS
		entity_run_class_scripts("step");
		if (collision_count_entities > 0 || collision_count_tiles > 0){			
			collision_contact_y = "none";
			if (sign(final_y_push) < 0){collision_contact_y = "bottom"}
			else if (sign(final_y_push) > 0){collision_contact_y = "top"}	
			
			collision_contact_x = "none";
			if (sign(final_x_push) < 0){collision_contact_x = "right"}
			else if (sign(final_x_push) > 0){collision_contact_x = "left"}
			
			if (collision_count_entities > 0){entity_run_class_scripts("collide_entity")}
			if (collision_count_tiles > 0){entity_run_class_scripts("collide_tile")}
		}
	#endregion
	
	if (ACTIVE && ALIVE){
		#region //ANIMATION
			var	animation_sprite = asset_get_index(entity_type + "_" + animation_name);
			sprite_index = (animation_sprite > 0) ? animation_sprite : asset_get_index(entity_type + "_idle");
		#endregion
		
		#region //HEALTH
			if (status_health_current <= 0){
				var me = id;
				with(entity_killer){entity_kill(me)}
			}
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