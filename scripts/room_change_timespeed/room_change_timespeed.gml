var change = argument0;
TIMESPEED = change;
with(ENTITY){image_speed = TIMESPEED};
if (global.replay_mode == "record"){
	var action_name = "time_speed";
	var action_arguments = change;
	ds_list_add(global.replay_data, [room_age_real, id, action_name, action_arguments]);
}