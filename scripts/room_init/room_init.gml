var room_id = instance_create_depth(0,0,0,ROOM_OBJECT);
if (room_get_name(room) == "RM0_GAME"){
	room_goto(global.room_current)
}