var me = id;

if (player_main_actor != noone && instance_exists(player_main_actor)){
	camera_target_x = player_main_actor.x;
	camera_target_y = player_main_actor.y;
	
	if (player_hit_slowmo > 1){
		player_hit_slowmo--;
		room_change_timespeed(0.1);
	} else if (player_hit_slowmo == 1) {
		room_change_timespeed(1);
	}

} else {
	with(ENTITY){
		if (entity_type_lower == me.player_main_actor_type){
			me.player_main_actor = id;
			me.camera_x = x;
			me.camera_y = y;
		}
	}
}

