if (ROOM.player_main_actor == id){	
	if (my_beatdown_cooldown_timer <= 0){
		entity_draw_text_following("beatdown!", [cos(degtorad(270))*40, sin(degtorad(270))*40], 1*SEC, c_white, 14);
		room_timespeed_temp(0.01, 0.75*SEC, true);
		my_beatdown_cooldown_timer = my_beatdown_cooldown_value;
	}
}