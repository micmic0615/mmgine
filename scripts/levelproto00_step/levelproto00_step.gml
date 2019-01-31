if (keyboard_check_pressed(global.key_pause)){
	var me = id;
	
	var spawn_roster = [
		Wasp,
		Shooter,
		
		//Seeker,
		//Pelter,
		//Charger
	]
	
	var spawn_roster_size = array_length_1d(spawn_roster);
	
	var enemy_count = 0;	
	for(var i = 0; i < spawn_roster_size;i++){enemy_count += instance_number(spawn_roster[i])};
	
	if (enemy_count < 32){
		var spawned_actor = room_spawn_random_from_main_actor(spawn_roster[stage_spawn_cycle]);
		stage_spawn_cycle++;
		if (stage_spawn_cycle > (spawn_roster_size - 1)){stage_spawn_cycle = 0};	
		with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
		with(player_main_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration*0.5, [], "ai_immortal")};
	}
}

if (keyboard_check_pressed(global.key_backspace)){
	var mc = player_main_actor;
	with(ACTOR){
		if (entity_enabled() && player_faction != mc.player_faction){
			var enemy = id;
			with(mc){
				entity_damage_deal([enemy, 999, true])
			}
		}
	}
}

if (screen_cover_alpha > 0){screen_cover_alpha -= 1*PPS*TIMESPEED}