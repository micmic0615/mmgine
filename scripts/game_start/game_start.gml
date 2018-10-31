room_speed = 60;

#macro ROOM_BASE "RoomBase"
#macro ACTIVE active
#macro ALIVE alive
#macro ROOM room_object

#macro INFINITY 9999999
#macro TIMESPEED global.time_speed
#macro PPS (1/(room_speed/TIMESPEED))
#macro SEC (room_speed) div 1

#macro GRAVITY_ANGLE global.gravity_angle
#macro GRAVITY_FORCE global.gravity_force
#macro GRAVITY_MAX global.gravity_max

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
