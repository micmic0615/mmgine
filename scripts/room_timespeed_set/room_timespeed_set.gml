var change = argument0;
global.time_speed = change;
with(ENTITY){image_speed = TIMESPEED};
if (global.replay_mode == "record"){
	actor_record_replay_data("time_speed", change)
}