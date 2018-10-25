if (ACTIVE && ALIVE){
	switch(bullet_collision_tile_action){
		case "die": 
			entity_kill(id);
			break;
			
		case "bounce":
			if (collision_contact_x != "none" || collision_contact_y != "none"){
				var rad_angle = degtorad(bullet_action_move_angle);
				var force_x = cos(rad_angle)*100;
				var force_y = sin(rad_angle)*100;
				
				if (collision_contact_x != "none"){force_x = force_x*-1};
				if (collision_contact_y != "none"){force_y = force_y*-1};
				
				var new_angle = angle_between(x + force_x, y + force_y, x, y);
				bullet_action_move_angle = new_angle;
				
				for(var i = 0; i < ds_list_size(physics_motion_list);i++){
					var p = ds_list_find_value(physics_motion_list, i);
	
					var motion_x = p[0];
					var motion_y = p[1];
					
					if (collision_contact_x != "none"){motion_x = motion_x*-1};
					if (collision_contact_y != "none"){motion_y = motion_y*-1};
	
					ds_list_replace(physics_motion_list, i, [
						motion_x,
						motion_y,
						p[2],
						p[3],
						p[4]
					])
				}
				
				for(var i = 0; i < ds_list_size(bullet_collision_entity_actions);i++){
					var p = ds_list_find_value(bullet_collision_entity_actions, i);
					if (p[0] == "push"){
						ds_list_replace(bullet_collision_entity_actions, i, [
							p[0],
							p[1],
							p[2],
							bullet_action_move_angle
						])
					}
				}
			}
			break
	}
	
	entity_run_type_scripts("collide_tile");
}