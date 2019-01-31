if (stage_trigger){
	screen_cover_alpha = 1.5;
	screen_cover_color = c_white;
	stage_boss = room_spawn_random_from_main_actor(Swarmer, 1200, 0);
	stage_boss.ai_delay = 3*SEC;
	camera_x = stage_boss.x;
	camera_y = stage_boss.y - window_get_height()/2;
	if (stage_boss != noone){ds_list_add(stage_actors_list, stage_boss) };
	if (ds_list_size(stage_actors_list) >= 1){
		stage_trigger = false
	};
	
	stage_time_stamp = room_age_game + 3*SEC;
	
	if (ds_list_size(stage_actors_list) >= 1){		
		stage_trigger = false
	};
} else {
	if (floor(stage_time_stamp) = floor(room_age_game)){
		stage_time_stamp = 0;
		screen_cover_text = undefined;
	} else if (floor(stage_time_stamp) = floor(room_age_game + 1*SEC)){
		room_timespeed_temp(0.05, 3*SEC, true);
		screen_cover_text = stage_boss.player_boss_name
	} 
	
	if (stage_time_stamp != 0){
		with(Swarmer){
			ai_delay = 3*SEC;
			actor_buff_apply("movespeed_set_raw", 0.1*SEC, [100*PPS], "cinematic_set");
			entity_move_point([ROOM.player_main_actor.x, ROOM.player_main_actor.y]);
		}
		camera_target_x = stage_boss.x;
		camera_target_y = stage_boss.y;
	}
	
	if (ds_list_size(stage_actors_list) == 0){
		level00_next()
	}
}