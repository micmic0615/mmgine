entity_run_type_scripts("destroy");

var main_actor = ROOM.player_main_actor;
if (instance_exists(main_actor)){
	if (main_actor == id){room_timespeed_temp(0.05, 3*SEC, true)}
	else if (main_actor.player_faction != player_faction){room_timespeed_temp(0.05, 1*SEC, true)}
}

entity_mirage_create(3*SEC, 0, 0, make_color_rgb(255,0,0))