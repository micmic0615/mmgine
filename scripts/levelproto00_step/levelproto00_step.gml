if (keyboard_check_pressed(global.key_pause)){
	var me = id;
	
	var enemy_count = 0;
	enemy_count += instance_number(Shooter);
	enemy_count += instance_number(Seeker);
	enemy_count += instance_number(Pelter);
	enemy_count += instance_number(Charger);
	
	if (enemy_count < 32){
		var spawn_type = Shooter;
		switch(stage_spawn_cycle){
			case 0: spawn_type = Shooter; break;
			case 1: spawn_type = Seeker; break;
			case 2: spawn_type = Pelter; break;
			case 3: spawn_type = Charger; break;
		}
	
		var spawned_actor = room_spawn_random_from_main_actor(spawn_type);
	
		stage_spawn_cycle++;
		if (stage_spawn_cycle > 3){stage_spawn_cycle = 0};	
	
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
				actor_flinch_deal([enemy, 999])
			}
		}
	}
}

if (screen_cover_alpha > 0){screen_cover_alpha -= 1*PPS*TIMESPEED}