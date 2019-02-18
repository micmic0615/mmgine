var enemies = INFINITY;
if (player_main_actor != noone && entity_enabled(player_main_actor)){
	enemies = 0;
	var mc = player_main_actor;
	with (ACTOR){if (player_faction != mc.player_faction){enemies++}}
}

return enemies