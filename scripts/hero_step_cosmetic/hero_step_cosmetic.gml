var has_ping = 0;

for(var i = 0; i < ds_list_size(status_buff_list);i++){
	var p = ds_list_find_value(status_buff_list, i);
	var buff_id = p[3];
	var duration = p[1];
	
	if (has_ping == 0 && buff_id == "ping_speed_burst"){
		has_ping = duration
	}
}

var floor_age = floor(ROOM.room_age_game);
var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
		
if (has_ping > 0){
	if (animation_name == "walk"){animation_name = "dash"};
			
	if (floor_age % (0.1*SEC) == 0 && floor_age != next_floor_age){
		entity_mirage_create(0.25*SEC, 0, 0, make_color_rgb(255,0,255))
	};
}