var change = argument0;
TIMESPEED = change;
with(ENTITY){image_speed = TIMESPEED};
if (global.replay_mode == "record"){
	actor_record_replay_data("time_speed", change)
}