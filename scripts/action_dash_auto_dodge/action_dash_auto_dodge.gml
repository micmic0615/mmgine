if (action_dash[?"auto_dodge_enabled"]){
	if (		
		actor_actions_idle_total &&
		action_dash[?"auto_dodge_cooldown_timer"] <= 0
	){
		var did_dodge = false;
		for(var i = 0; i < ds_list_size(collision_entities_valid);i++){
			var p = ds_list_find_value(collision_entities_valid, i);
			if (p.entity_class_lower == "bullet" && p.player_faction != player_faction){
				var bullet_distance = distance_between(x,y,p.x,p.y);
				if (bullet_distance < action_dash[?"auto_dodge_range_max"] && bullet_distance > action_dash[?"auto_dodge_range_min"]){
					var ran_dir = random(2);
					var dodge_dir = (ran_dir > 1 ? 60 : -60) + random_mirror(30);
					
					var rad_angle = degtorad(p.bullet_action_move_angle + dodge_dir);
					var angle_x = x + (cos(rad_angle)*10);
					var angle_y = y + (sin(rad_angle)*10);
					
					did_dodge = action_dash_trigger([angle_x, angle_y]);
					break
				}
			}
		}
		
		if (did_dodge){
			action_dash[?"auto_dodge_cooldown_timer"] = action_dash[?"auto_dodge_cooldown_value"]
		}
	}

	if (action_dash[?"auto_dodge_cooldown_timer"] > 0 && actor_actions_idle_basic == true){
		action_dash[?"auto_dodge_cooldown_timer"] -= TIMESPEED
	}
	
	if(!actor_actions_enabled){
		action_dash[?"auto_dodge_cooldown_timer"] = 0;
	}
}