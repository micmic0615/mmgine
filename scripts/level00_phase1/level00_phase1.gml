if (stage_trigger){
	screen_cover_alpha = 1.25;
	screen_cover_color = c_white;
	var me = id;
		
	var spawned_actor = room_spawn_random_from_main_actor(Shooter);
	
	
	with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
	if (spawned_actor != noone){ds_list_add(stage_actors_list, spawned_actor) };
	if (ds_list_size(stage_actors_list) >= 1){
		stage_trigger = false
	};
} else {
	if (ds_list_size(stage_actors_list) == 0){
		level00_next()
	}
}