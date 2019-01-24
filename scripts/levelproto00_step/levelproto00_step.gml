if (keyboard_check_pressed(global.key_pause)){
	var me = id;
	
	
	var spawn_random = random(100);
	
	if (spawn_random < 25){
		var spawned_actor = room_spawn_random_from_main_actor(Shooter);
	} else if (spawn_random < 50){
		var spawned_actor = room_spawn_random_from_main_actor(Seeker);
	} else if (spawn_random < 75){
		var spawned_actor = room_spawn_random_from_main_actor(Pelter);
	} else {
		var spawned_actor = room_spawn_random_from_main_actor(Charger);
	}
	
	
	with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
}

if (screen_cover_alpha > 0){screen_cover_alpha -= 1*PPS*TIMESPEED}