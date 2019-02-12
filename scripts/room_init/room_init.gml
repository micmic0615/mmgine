var room_id = instance_create_depth(0,0,0,ROOM_OBJECT);
if (!variable_global_exists("next_room")){
	global.next_room = room_next(room);
}

if (room_get_name(room) == "GameStart" ){
	room_goto(global.next_room)
}