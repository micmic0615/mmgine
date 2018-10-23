#macro INFINITY 9999999
#macro ROOM_BASE "RoomBase"
#macro TIMESPEED room_speed
#macro PPS (1/TIMESPEED)
#macro SEC TIMESPEED
#macro ACTIVE active
#macro ROOM room_object

show_debug_overlay(true);

room_goto(room_next(room));
