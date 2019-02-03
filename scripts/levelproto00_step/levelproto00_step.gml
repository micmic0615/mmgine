if (keyboard_check_pressed(global.key_pause)){
	global.draw_tips = !global.draw_tips
}

var me = id;
var enemy_count = 0;	
var spawn_roster = [
	Saber,
	Shooter,
	Stunner,
	Wasp,
	Swarmer
]
var spawn_roster_size = array_length_1d(spawn_roster);
for(var i = 0; i < spawn_roster_size;i++){
	if (spawn_roster[i] != Swarmer){
		enemy_count += instance_number(spawn_roster[i])
	} else {
		with(Swarmer){
			if (entity_enabled() && action_clone_original){
				enemy_count ++;
			}
		}
	}
	
};


var enemy_limit = 24;

if (keyboard_check_pressed(global.key_num_1)){
	if (enemy_count < enemy_limit){
		var spawned_actor = room_spawn_random_from_main_actor(Saber);
		with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
		room_timespeed_temp(0.05, 0.35*SEC, true);
	}
}

if (keyboard_check_pressed(global.key_num_2)){
	if (enemy_count < enemy_limit){
		var spawned_actor = room_spawn_random_from_main_actor(Shooter);
		with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
		room_timespeed_temp(0.05, 0.35*SEC, true);
	}
}

if (keyboard_check_pressed(global.key_num_3)){
	if (enemy_count < enemy_limit){
		var spawned_actor = room_spawn_random_from_main_actor(Stunner);
		with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
		room_timespeed_temp(0.05, 0.35*SEC, true);
	}
}

if (keyboard_check_pressed(global.key_num_4)){
	if (enemy_count < enemy_limit){
		var spawned_actor = room_spawn_random_from_main_actor(Wasp);
		with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
		room_timespeed_temp(0.05, 0.35*SEC, true);
	}
}

if (keyboard_check_pressed(global.key_num_5)){
	if (enemy_count < enemy_limit){
		var spawned_actor = room_spawn_random_from_main_actor(Swarmer);
		with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
		room_timespeed_temp(0.05, 0.35*SEC, true);
	}
}

if (keyboard_check_pressed(global.key_num_0)){
	if (enemy_count < enemy_limit){
		var random_num = random(100);
		var random_spawn = noone;
		
		if (random_num < 30){
			random_spawn = Saber
		} else if (random_num < 60){
			random_spawn = Shooter
		} else if (random_num < 75){
			random_spawn = Stunner
		} else if (random_num < 90){
			random_spawn = Wasp
		} else {
			random_spawn = Swarmer
		}
		
		var spawned_actor = room_spawn_random_from_main_actor(random_spawn);
		with(spawned_actor){actor_buff_apply("immortal", me.stage_spawn_immortal_duration, [], "ai_immortal")};
		room_timespeed_temp(0.05, 0.35*SEC, true);
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