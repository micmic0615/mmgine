if (global.replay_mode == "play"){
	var replay_actions = ds_map_find_value(global.replay_data, room_age_real);
			
	if (replay_actions != undefined){
				
		for (var i = 0; i < ds_list_size(replay_actions); ++i) {
			var p = ds_list_find_value(replay_actions, i);
					
			var actor_spawn_id = p[0];
			var position = p[1];
			var action_name = p[2];
			var action_argument = p[3];
				
			var instance = noone;
					
			with(ACTOR){ if (actor_spawn_id = actor_id){instance = id}}
					
			var me = id;
			switch(action_name){
				case "spawn_actor":	
					actor_spawn(position[0], position[1], action_argument[0], actor_spawn_id);
					break;
							
				case "move_angle":
					if (instance_exists(instance)){with(instance){ entity_move_angle(action_argument)}};
					break;
								
				case "move_point":
					if (instance_exists(instance)){with(instance){ entity_move_point(action_argument)}};
					break;						
							
				case "damage_deal":
					if (instance_exists(instance)){with(instance){x = position[0]; y = position[1]; entity_damage_deal(action_argument, true)}};
					break
							
				case "flinch_deal":
					if (instance_exists(instance)){with(instance){x = position[0]; y = position[1]; actor_flinch_deal(action_argument, true)}};
					break
							
				case "time_speed":
					room_timespeed_set(action_argument)
					break;
							
				default:
					if (instance_exists(instance)){with(instance){x = position[0]; y = position[1]; entity_run_class_scripts(action_name, action_argument)}};
					break
			}
		}
	}
			
	if (room_age_real >= global.replay_duration){
		global.replay_mode = "play";
		global.random_index = 0;
		global.actor_id_sequence = 0;
		room_goto(global.room_current);
	}
}