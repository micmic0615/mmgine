if (room_initiate){
	with(TILE){tile_original = true}
	room_initiate = false;
} else {
	room_step_time();
	room_step_player_controls();
	room_step_collision_validation();
	room_step_camera_and_loop();
	room_run_scripts("step");
	room_run_modules("step");
	
	//room_step_replay();
	
	room_age_real += 1;
	room_age_game += TIMESPEED;
}