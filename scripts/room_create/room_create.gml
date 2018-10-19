#macro ROOM id;

if (!variable_global_exists("next_room")){
	global.next_room = room_next(room);
}

if (room_get_name(room) == ROOM_BASE ){
	room_goto(global.next_room)
}