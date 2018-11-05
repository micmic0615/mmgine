if (room_initiate){
	with(TILE){tile_original = true}
	room_initiate = false;
} else {
	room_age_real += 1;
	room_age_game += TIMESPEED;

	room_player();
	room_run_scripts("step");

	#region // CAMERA
		var distance = distance_between(camera_x, camera_y, camera_target_x, camera_target_y);
		if (distance > camera_target_speed*2){
			var angle = arctan2(camera_target_y - camera_y, camera_target_x - camera_x);
			var speed_x = cos(angle)*camera_target_speed;
			var speed_y = sin(angle)*camera_target_speed;
	
			if (camera_target_acceleration_distance > 0){
				var distance_ratio = power((distance/camera_target_acceleration_distance), 1.5);
				speed_x = speed_x*distance_ratio;
				speed_y = speed_y*distance_ratio;
			} 
	
			camera_x += speed_x;
			camera_y += speed_y;
		}
		
		#region //LOOP
			if (room_loop_x || room_loop_y){
				var camera_loop_snap = false;
				var base_camera_x = camera_x;
				var base_camera_y = camera_y;
		
				if (room_loop_x){			
					if (camera_x < -50){
						camera_x += room_width;
						camera_loop_snap = true;
					} else if (camera_x > room_width + 50){
						camera_x -= room_width;
						camera_loop_snap = true;
					}
				}
		
				if (room_loop_y){			
					if (camera_y < -50){
						camera_y += room_height;
						camera_loop_snap = true;
					} else if (camera_y > room_height + 50){
						camera_y -= room_height;
						camera_loop_snap = true;
					}
				}
		
				var camera_size_w = camera_width/camera_zoom;
				var camera_size_h = camera_height/camera_zoom;
			
				var camera_view_x = camera_get_view_x(view_camera[0]);
				var camera_view_y = camera_get_view_y(view_camera[0]);
				var camera_size_w = camera_get_view_width(view_camera[0]);
				var camera_size_h = camera_get_view_height(view_camera[0]);
			
		
				if (camera_loop_snap){
					with(ENTITY){
						if (ACTIVE && camera_inside_view){
							x += (ROOM.camera_x - base_camera_x);
							y += (ROOM.camera_y - base_camera_y);
						}
					}
					
					for (var i = 0; i < ds_list_size(draw_mirage_list); ++i) {
						var p = ds_list_find_value(draw_mirage_list, i);
						var duration = p[9]; 
						if (duration > 0){
							var loc_x = p[2]; 
							var loc_y = p[3]; 
							
							var half_width = (sprite_width/2);
							var half_height = (sprite_height/2);
							
							if (
								(loc_x > camera_view_x - half_width && loc_x < camera_view_x + camera_size_w + half_width) && 
								(loc_y > camera_view_y - half_height && loc_y < camera_view_y + camera_size_h + half_height)
							){
								p[2] += (camera_x - base_camera_x);
								p[3] += (camera_y - base_camera_y);
								ds_list_replace(draw_mirage_list, i, p);
							}
						}
					}
				} else {
					
					with(ENTITY){
						if (ACTIVE && !camera_inside_view) {
							var x_camera_center = camera_view_x + camera_size_w*0.5;
							var x_camera_distance = abs(x - x_camera_center);
							if (x_camera_distance > room_width*0.5){
								x = (x > x_camera_center) ? (x - room_width) : (x + room_width);
							}
						
						
							var y_camera_center = camera_view_y + camera_size_h*0.5;
							var y_camera_distance = abs(y - y_camera_center);
							if (y_camera_distance > room_height*0.5){
								y = (y > y_camera_center) ? (y - room_height) : (y + room_height);
							}
						}
					}
				}
			}
		#endregion

		var center_x = camera_x - camera_size_w*0.5;
		var center_y = camera_y - camera_size_h*0.5;

		camera_set_view_pos(view_camera[0], center_x, center_y);
		camera_set_view_size(view_camera[0], camera_size_w, camera_size_h);
		camera_set_view_angle(view_camera[0], camera_angle);
	#endregion
	
	#region // REPLAY
		if (global.replay_mode == "play"){
			for (var i = 0; i < ds_list_size(global.replay_data); ++i) {
				var p = ds_list_find_value(global.replay_data, i);
				
				var timestamp = p[0];
				var instance = p[1];
				var action_name = p[2];
				var action_argument = p[3];
				
			
				
				if (timestamp == room_age_real){
					var me = id;
					switch(action_name){
						case "move_angle":
							with(instance){entity_move_angle(action_argument)};
							break;
								
						case "move_point":
							with(instance){entity_move_point(action_argument)};
							break;
								
						case "time_speed":
							room_change_timespeed(action_argument)
							break;
							
						default:
							with(instance){entity_run_class_scripts(action_name, action_argument)};
					}
				}
			}
			
			if (room_age_real >= global.replay_duration + 1*SEC){
				room_goto(global.next_room);
			}
		}
	#endregion
}