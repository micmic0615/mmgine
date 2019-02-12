if (room_name_lower == "levelarena"){
	global.parent_room = asset_get_index(room_get_name(room));
	global.parent_loaded = true;
	
	var level_random = max(1, ceil(random(4)));
	if (level_random < 10){level_random = "0" + string(level_random)};
	
	room_goto(asset_get_index("LevelArena" + level_random))
} else {
	if (global.parent_loaded){
		global.parent_loaded = false;
		levelarena_create_randomize_room_layout();
	} else {
		room_goto(global.parent_room)
	}
}