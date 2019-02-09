var action_map_source = argument[0];
var action_name = argument[1];

var action_map = ds_map_create();
ds_map_copy(action_map, action_map_source);

if (actor_actions_enabled){
	switch(action_map[?"sequence"]){
		case 1:
			if (action_map[?"cast_timer"] > 0){
				if (!action_map[?"free_action"]){actor_actions_idle_total = false};
				var script_name = asset_get_index("action_" + action_name + "_cast_active");
				if (script_name > -1){script_execute(script_name, action_map)};		
				entity_run_type_scripts("action_generic_cast_active", action_map);
				animation_name = action_map[?"animation_cast"];
				action_map[?"cast_timer"] -= TIMESPEED;				
			} else {
				if (actor_actions_id == action_name || action_map[?"free_action"]){	
					if (!action_map[?"free_action"]){
						actor_actions_idle_basic = false;
						
						for(var i = 0; i < ds_list_size(actor_actions_module);i++){
							var p = ds_list_find_value(actor_actions_module, i);
						
							if (p[0] != action_name){
								var action_module = variable_instance_get(id, "action_" + p[0]);
								if (action_module != undefined && action_module[?"free_action"] != true){
									action_module[?"cast_timer"] = 0;
									action_module[?"channel_timer"] = 0;
									action_module[?"backswing_timer"] = 0;
									action_module[?"sequence"] = 0;
								}
							}
						};
					}
					
					var script_name = asset_get_index("action_" + action_name + "_cast_point");
					if (script_name > -1){script_execute(script_name, action_map)};
					entity_run_type_scripts("action_generic_cast_point", action_map);
					action_map[?"channel_timer"] = action_map[?"channel_value"];
					action_map[?"backswing_timer"] = action_map[?"backswing_value"];
					action_map[?"cooldown_timer"] = action_map[?"cooldown_value"];
					animation_name = action_map[?"animation_channel"];
					image_index = 0;
					
					action_map[?"sequence"] = 2;
				} else {
					action_map[?"cast_timer"] = 0;
					action_map[?"channel_timer"] = 0;
					action_map[?"cooldown_timer"] = 0;
					action_map[?"sequence"] = 0;
				}
			}; break
			
		case 2:
			if (action_map[?"channel_timer"] > 0){
				var script_name = asset_get_index("action_" + action_name + "_channel_active");
				if (script_name > -1){script_execute(script_name, action_map)};
				entity_run_type_scripts("action_generic_channel_active", action_map);
				animation_name = action_map[?"animation_channel"];
				action_map[?"channel_timer"] -= TIMESPEED;
				
			} else {
				if (!action_map[?"free_action"]){actor_actions_idle_basic = true}
				var script_name = asset_get_index("action_" + action_name + "_channel_point");
				if (script_name > -1){script_execute(script_name, action_map)};
				entity_run_type_scripts("action_generic_channel_point", action_map);
				animation_name = action_map[?"animation_backswing"];
				image_index = 0;
				
				action_map[?"sequence"] = 3;
			}; break
			
		case 3:
			if (action_map[?"backswing_timer"] > 0){
				var script_name = asset_get_index("action_" + action_name + "_backswing_active");
				if (script_name > -1){script_execute(script_name, action_map)};
				entity_run_type_scripts("action_generic_backswing_active", action_map);
				animation_name = action_map[?"animation_backswing"];
				action_map[?"backswing_timer"] -= TIMESPEED;
			} else {
				if (!action_map[?"free_action"]){actor_actions_idle_total = true};
				var script_name = asset_get_index("action_" + action_name + "_backswing_point");
				if (script_name > -1){script_execute(script_name, action_map)};
				entity_run_type_scripts("action_generic_backswing_point", action_map);
				if (actor_actions_id == action_name){
					actor_actions_id = "none";
				};
				action_map[?"target_entity"] = noone;
				action_map[?"target_point"] = [0,0];
				action_map[?"target_angle"] = 0;
				action_map[?"sequence"] = 0;
			}; break;
	}
} else {
	action_map[?"cast_timer"] = 0;
	action_map[?"channel_timer"] = 0;
	action_map[?"backswing_timer"] = 0;
	action_map[?"target_entity"] = noone;
	action_map[?"target_point"] = [0,0];
	action_map[?"target_angle"] = 0;
	
	if (actor_actions_id == action_name){
		actor_actions_id = "none";
	}
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
