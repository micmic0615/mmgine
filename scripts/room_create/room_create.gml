room_loop_x = true;
room_loop_y = true;
room_initiate = true;
room_name_lower = string_lower(room_get_name(room));

camera_x = 0;
camera_y = 0;
camera_zoom = 1;
camera_width = window_get_width();
camera_height = window_get_height();
camera_target_x = camera_x;
camera_target_y = camera_y;
camera_target_speed = 200*PPS;
camera_target_acceleration_distance = 100;
camera_angle = 0;

player_controllable = true;
player_faction = 0;
player_main_actor_type = "hero"



room_run_scripts("create");

view_visible[0] = true;
view_enabled = true;

var center_x = camera_x - camera_width*0.5/camera_zoom;
var center_y = camera_y - camera_height*0.5/camera_zoom;

view_camera[0] = camera_create_view(center_x, center_y, camera_width/camera_zoom, camera_height/camera_zoom, camera_angle);