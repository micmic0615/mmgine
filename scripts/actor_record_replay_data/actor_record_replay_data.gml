if (global.replay_mode == "record"){
	var action_name = argument0;
	var action_arguments = argument1;
	ds_list_add(global.replay_data, [ROOM.room_age_real, id, action_name, action_arguments]);
}