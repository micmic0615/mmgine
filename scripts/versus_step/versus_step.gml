

if (!ds_exists(ROOM.player_controllers, ds_type_list)){
	ROOM.player_controllers = ds_create("list");
}

if (ROOM.versus_start){
	camera_x = (room_width/2);
	camera_y = (room_height/2);
	ds_list_add(ROOM.player_controllers, [-1, noone])
	ROOM.versus_start = false;
	
	screen_cover_alpha = 1;
	screen_cover_color = c_white;
}


var maxpads = gamepad_get_device_count();
for (var i = 0; i < maxpads; i++){
	if (gamepad_is_connected(i)){
		var active_controller_id = i;
		var controller_found = false;
		for (var i2 = 0; i2 < ds_list_size(ROOM.player_controllers); i2++){
			var registered_controller = ds_list_find_value(ROOM.player_controllers, i2);
			if (registered_controller[0] == active_controller_id){
				controller_found = true;
			}
		}
		
		if (!controller_found){
			ds_list_add(ROOM.player_controllers, [active_controller_id, noone, 0])
		}
    }
}

var camera_center_x = 0;
var camera_center_y = 0;
var controller_count = ds_list_size(ROOM.player_controllers);
var alive_players = 0;
var camera_min_x = INFINITY, camera_max_x = 0;
var camera_min_y = INFINITY, camera_max_y = 0;

for (var i = 0; i < controller_count; i++){
	var player_data = ds_list_find_value(ROOM.player_controllers, i);
	if (player_data[1] != noone && player_data[1] != "dead" && entity_enabled(player_data[1])){
		alive_players += 1;
	}
}

for (var i = 0; i < controller_count; i++){
	var player_data = ds_list_find_value(ROOM.player_controllers, i);
	
	if (player_data[1] == noone){
		var new_hero = actor_spawn((room_width/2) + random_mirror(room_width/2), (room_height/2) + random_mirror(room_height/2), Hero);
		new_hero.player_faction = player_data[0];
		new_hero.versus_aim_x = 0;
		new_hero.versus_aim_y = 0;
		new_hero.versus_should_aim = false;
		player_data[1] = new_hero;
		
		//with(new_hero){
		//	actor_buff_apply("immortal", 2*SEC, [], "spawn_shield");
		//}
		
		
		ds_list_replace(ROOM.player_controllers, i, player_data);
	} else {
		if (player_data[1] == "dead"){
			player_data[2] = player_data[2] - TIMESPEED;
			if (player_data[2] <= 0){player_data[1] = noone}
			ds_list_replace(ROOM.player_controllers, i, player_data);
		} else {
			var player_hero = player_data[1];
			if (entity_enabled(player_hero)){
				camera_center_x += (player_hero.x / alive_players)
				camera_center_y += (player_hero.y / alive_players) 
				
				if (player_hero.x < camera_min_x){camera_min_x = player_hero.x}
				if (player_hero.x > camera_max_x){camera_max_x = player_hero.x}
				
				
				if (player_hero.y < camera_min_y){camera_min_y = player_hero.y}
				if (player_hero.y > camera_max_y){camera_max_y = player_hero.y}
		
				versus_step_controls(player_data[0], player_data[1]); 
			} else {
				player_data[1] = "dead";
				player_data[2] = 1*SEC;
				ds_list_replace(ROOM.player_controllers, i, player_data);
			}
		}
	}
}
var camera_padding = 300;
var camera_player_zoom = distance_between(camera_min_x - camera_padding, camera_min_y - camera_padding, camera_max_x + camera_padding, camera_max_y + camera_padding);
var camera_hypoteneus = sqrt(sqr(ROOM.camera_width) + sqr(ROOM.camera_height));


if (ROOM.versus_camera_cooldown > 0){
	ROOM.versus_camera_cooldown -= 1;
} else {
	ROOM.versus_camera_size = (1/(camera_player_zoom/camera_hypoteneus));
	ROOM.versus_camera_cooldown = 1*SEC;
}

var local_camera_speed = ROOM.versus_camera_speed * ( 1 - min(0.5, ROOM.camera_zoom / ROOM.versus_camera_size))
if (ROOM.camera_zoom - local_camera_speed > ROOM.versus_camera_size){
	ROOM.camera_zoom -= local_camera_speed
} else if (ROOM.camera_zoom + local_camera_speed < ROOM.versus_camera_size) {
	ROOM.camera_zoom += local_camera_speed
}

ROOM.camera_target_x = camera_center_x;
ROOM.camera_target_y = camera_center_y;