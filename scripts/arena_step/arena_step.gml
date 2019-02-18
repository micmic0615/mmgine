if (room_enemy_count() == 0){
	switch(arena_enemy_waves_status){
		case "spawn":
			room_timespeed_temp(0.05, 0.25*SEC);
			screen_cover_alpha = 1;
			screen_cover_color = c_white;
			arena_enemy_waves_status = "fight";
			
			var current_wave = arena_enemy_waves_data[arena_enemy_waves_current];
			
			var current_upkeep = current_wave[0];
			var current_roster = current_wave[1];
				
			while(current_upkeep){
				var spawned_actor = arena_spawn_wave(current_roster);
				current_upkeep -= spawned_actor.actor_upkeep_cost;
			}
			break;
			
		case "fight":
			arena_enemy_waves_current++;
			if (arena_enemy_waves_current < array_length_1d(arena_enemy_waves_data)){
				arena_enemy_waves_status = "spawn";
			};
			break;
	}
}