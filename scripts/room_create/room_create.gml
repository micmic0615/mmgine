ROOM = id;
ACTIVE = true;
ALIVE = true;

physics_time_local = 1;
random_set_seed(random(INFINITY))

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
player_main_actor = noone;
player_main_actor_type = "hero";

player_controls_move_dash_timer_right = 0;
player_controls_move_dash_timer_left = 0;
player_controls_move_dash_timer_up = 0;
player_controls_move_dash_timer_down = 0;
player_controls_move_dash_timer_value = 0.25*SEC;

time_base = 1;
time_change = 1;
time_change_duration = 0;

screen_cover_alpha = 0;
screen_cover_color = c_white;
screen_cover_text = undefined;


var me = id;

draw_mirage_list = ds_create("list");
draw_text_list = ds_create("list"); 

room_run_scripts("create");

view_visible[0] = true;
view_enabled = true;

var center_x = camera_x - camera_width*0.5/camera_zoom;
var center_y = camera_y - camera_height*0.5/camera_zoom;

view_camera[0] = camera_create_view(center_x, center_y, camera_width/camera_zoom, camera_height/camera_zoom, camera_angle);

global.random_index = 0;

if (global.replay_mode == "record" && room_get_name(room) != ROOM_BASE){
	ds_map_destroy(global.replay_data);
	global.replay_data = ds_map_create();
	
	ds_list_destroy(global.random_seed);
	global.random_seed = ds_list_create();
	
	random_seed_populate();
} else if (global.replay_mode == "play"){
	
}

with(ACTOR){
	if (!variable_instance_exists(id, "actor_id")){
		if (global.replay_mode == "record"){actor_spawn(x,y,object_index)};
		instance_destroy(id, false);
	}
}