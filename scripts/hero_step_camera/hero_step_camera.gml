if (ROOM.camera_zoom + my_camera_zoom_speed < my_camera_zoom_current){
	ROOM.camera_zoom += my_camera_zoom_speed
}

if (ROOM.camera_zoom - my_camera_zoom_speed > my_camera_zoom_current){
	ROOM.camera_zoom -= my_camera_zoom_speed
}

var me = id;
var max_distance = 0
with(ACTOR){
	if (me.player_faction != player_faction && variable_instance_exists(id, "ai_target_attack_should_channel")){
		if (ai_target_attack_should_channel == true){
			var current_distance = distance_between(x,y,me.x,me.y);
			if (current_distance > max_distance){
				max_distance = current_distance
			}
		}
		
	}
}

var multiplier = (max_distance*1.75) / ((room_width/2) + (room_height/2));
my_camera_zoom_current = my_camera_zoom_min + (multiplier*(my_camera_zoom_max - my_camera_zoom_min))