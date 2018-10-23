#macro INFINITY 9999999
#macro ROOM_BASE "RoomBase"
#macro TIMESPEED room_speed
#macro PPS (1/TIMESPEED)
#macro SEC TIMESPEED div 1
#macro ACTIVE active
#macro ROOM room_object

show_debug_overlay(true);

global.mouse_1 = mb_left;
global.mouse_2 = mb_right;
global.mouse_3 = mb_middle;

global.key_up = ord("W");
global.key_down = ord("S");
global.key_left = ord("A");
global.key_right = ord("D");

global.key_action_1 = vk_space;


room_goto(room_next(room));
