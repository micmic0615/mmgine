var me = id;
var max_distance = 0;
if (ROOM.player_main_actor == id){
	with(ACTOR){
		if (me.player_faction != player_faction && variable_instance_exists(id, "ai_target_attack_should_channel")){
			var should_add = true;
			var current_distance = distance_between(x,y,me.x,me.y);
			if (ai_target_attack_should_channel || player_boss == true){
				if (current_distance > max_distance){max_distance = current_distance}
			} else {
				if (
					variable_instance_exists(id, "enemy_attack_range_threat") &&
					current_distance < enemy_attack_range_threat
				){
					if (current_distance > max_distance){max_distance = current_distance}
				} else {
					should_add = false;
				}
			}
		
			var add_index = -1;
			for(var i = 0; i < ds_list_size(me.my_camera_threats);i++){
				var p = ds_list_find_value(me.my_camera_threats, i);				
				if (p[0] == id){add_index = i}
			}
		
		
			if (should_add && add_index == -1){
				ds_list_add(me.my_camera_threats, [id, me.entity_age, me.x, me.y])
			} else if (!should_add && add_index >= 0) {
				ds_list_delete(me.my_camera_threats, add_index)
			}
		
		}
	}

	var room_diagonal_size = sqrt(sqr(window_get_width()) + sqr(window_get_height()));
	var multiplier = min(1, ((max_distance*1) / room_diagonal_size));

	var new_camera_zoom = my_camera_zoom_min + (multiplier*(my_camera_zoom_max - my_camera_zoom_min));

	if (new_camera_zoom < my_camera_zoom_current){
		my_camera_cooldown_timer = my_camera_cooldown_value;
		my_camera_zoom_current = new_camera_zoom
	} else {
		if (my_camera_cooldown_timer > 0){
			my_camera_cooldown_timer -= 1;
		} else {
			my_camera_cooldown_timer = my_camera_cooldown_value;
			my_camera_zoom_current = new_camera_zoom
		}
	}

	if (my_shoot_aim_mode == true && my_camera_zoom_current > my_camera_zoom_aim){my_camera_zoom_current = my_camera_zoom_aim}

	var camera_snap_step = round(1/(abs(my_camera_zoom_max - my_camera_zoom_min)/6));
	var camera_snap_current = round(camera_snap_step*my_camera_zoom_current)/camera_snap_step;

	if (ROOM.camera_zoom + my_camera_zoom_speed < camera_snap_current){
		ROOM.camera_zoom += my_camera_zoom_speed
	}

	if (ROOM.camera_zoom - my_camera_zoom_speed > camera_snap_current){
		ROOM.camera_zoom -= my_camera_zoom_speed
	}
}