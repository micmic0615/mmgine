if (entity_enabled()){
	switch(bullet_collision_tile_action){
		case "die": 
			status_health_current = 0;
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
			}
			break
	}
	
	entity_run_type_scripts("collide_tile");
}