if (ROOM.player_main_actor == id){	
	if (my_beatdown_cooldown_timer <= 0){
		room_timespeed_temp(0.01, 0.75*SEC, true);
		my_beatdown_cooldown_timer = my_beatdown_cooldown_value;
	}
}