room_speed = 60;

#macro INFINITY 9999999
#macro ROOM_BASE "RoomBase"
#macro TIMESPEED global.time_speed
#macro PPS (1/(room_speed/TIMESPEED))
#macro SEC (room_speed) div 1
#macro ACTIVE active
#macro ALIVE alive
#macro ROOM room_object


show_debug_overlay(true);

global.time_speed = 1;
global.mouse_1 = mb_left;
global.mouse_2 = mb_right;
global.mouse_3 = mb_middle;

global.key_up = ord("W");
global.key_down = ord("S");
global.key_left = ord("A");
global.key_right = ord("D");

global.key_action_1 = vk_space;

global.key_pause = vk_enter;


room_goto(room_next(room));
