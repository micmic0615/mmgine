GRAVITY_ANGLE = 90;
GRAVITY_FORCE = 40*PPS / (1*SEC);
GRAVITY_MAX = 120*PPS;
depth = 60;
ds_inventory = ds_list_create();

room_loop_x = true;
room_loop_y = true;
room_initiate = true;
room_name_lower = string_lower(room_get_name(room));

room_age_real = 0;
room_age_game = 0;

camera_x = 0;
camera_y = 0;
camera_zoom = 1/1.5;
camera_width = window_get_width();
camera_height = window_get_height();
camera_target_x = camera_x;
camera_target_y = camera_y;
camera_target_speed = 200*PPS;
camera_target_acceleration_distance = 100;
camera_angle = 0;

player_controllable = true;
player_faction = 0;
player_main_actor_type = "hero";

var me = id;
with(ENTITY){
	if (entity_type_lower == me.player_main_actor_type){
		me.camera_x = x;
		me.camera_y = y;
	}
}

draw_mirage_list = ds_create("list");

room_run_scripts("create");

view_visible[0] = true;
view_enabled = true;

var center_x = camera_x - camera_width*0.5/camera_zoom;
var center_y = camera_y - camera_height*0.5/camera_zoom;

view_camera[0] = camera_create_view(center_x, center_y, camera_width/camera_zoom, camera_height/camera_zoom, camera_angle);