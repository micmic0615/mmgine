if (ROOM.player_main_actor == id){		
	actor_buff_apply("untimed", 0.5*SEC, [], "untimed");
	room_timespeed_temp(0.01, 0.5*SEC, true)
}