if (global.replay_mode == "record"){
	var action_name = argument0;
	var action_arguments = argument1;
	var me = id;
	with(ROOM){
		if (!ds_map_exists(global.replay_data, room_age_real)){
			ds_map_add(global.replay_data, room_age_real, ds_create("list"));
		}
		
		var replay_map_list = ds_map_find_value(global.replay_data, room_age_real);
		ds_list_add(replay_map_list, [ROOM == me ? "room" : me.actor_id, [me.x,me.y], action_name, action_arguments]);
	}
}