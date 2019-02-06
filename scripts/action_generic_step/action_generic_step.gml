var action_map_source = argument[0];
var action_name = argument[1];

var action_map = ds_map_create();
ds_map_copy(action_map, action_map_source);

if (actor_actions_enabled){
	switch(action_map[?"sequence"]){
		case 1:
			if (action_map[?"cast_timer"] > 0){
				var script_name = asset_get_index("action_" + action_name + "_cast_active");
				if (script_name > -1){script_execute(script_name)};		
				animation_name = action_map[?"animation_cast"];
				action_map[?"cast_timer"] -= TIMESPEED;				
			} else {
				if (actor_actions_id == action_name){
					actor_actions_idle = false;
					
					var script_name = asset_get_index("action_" + action_name + "_cast_point");
					if (script_name > -1){script_execute(script_name)};
					action_map[?"channel_timer"] = action_map[?"channel_value"];
					action_map[?"backswing_timer"] = action_map[?"backswing_value"];
					action_map[?"cooldown_timer"] = action_map[?"cooldown_value"];
					animation_name = action_map[?"animation_channel"];
					image_index = 0;
					
					action_map[?"sequence"] = 2;
				} else {
					action_map[?"channel_timer"] = 0;
					action_map[?"cooldown_timer"] = 0;
					action_map[?"sequence"] = 0;
				}
			}; break
			
		case 2:
			if (action_map[?"channel_timer"] > 0){
				var script_name = asset_get_index("action_" + action_name + "_channel_active");
				if (script_name > -1){script_execute(script_name)};
				animation_name = action_map[?"animation_channel"];
				action_map[?"channel_timer"] -= TIMESPEED;
			} else {
				actor_actions_idle = true;	
				var script_name = asset_get_index("action_" + action_name + "_channel_point");
				if (script_name > -1){script_execute(script_name)};
				animation_name = action_map[?"animation_backswing"];
				image_index = 0;
				
				action_map[?"sequence"] = 3;
			}; break
			
		case 3:
			if (action_map[?"backswing_timer"] > 0){
				var script_name = asset_get_index("action_" + action_name + "_backswing_active");
				if (script_name > -1){script_execute(script_name)};
				animation_name = action_map[?"animation_backswing"];
				action_map[?"backswing_timer"] -= TIMESPEED;
			} else {
				var script_name = asset_get_index("action_" + action_name + "_backswing_point");
				if (script_name > -1){script_execute(script_name)};
				actor_actions_id = "none";
				action_map[?"sequence"] = 0;
			}; break;
	}
} else {
	action_map[?"cast_timer"] = 0;
	action_map[?"channel_timer"] = 0;
	action_map[?"backswing_timer"] = 0;
}

if (action_map[?"sequence"] == 0){
	if (action_map[?"cooldown_timer"] > 0){
		action_map[?"cooldown_timer"] -= TIMESPEED
	}
}

if (
	action_map[?"sequence"] == 0 ||
	action_map[?"sequence"] == 3
){
	if (action_map[?"backswing_timer"] > 0){
		action_map[?"backswing_timer"] -= TIMESPEED
	}
}

ds_map_copy(action_map_source, action_map);
ds_map_destroy(action_map);
