my_camera_zoom_speed = 0.1*PPS;

my_camera_zoom_min = 1.0;
my_camera_zoom_aim = 0.85;
my_camera_zoom_max = 0.65;

my_camera_zoom_current = my_camera_zoom_min;

my_camera_threats = ds_create("list");
my_camera_cooldown_timer = 0;
my_camera_cooldown_value = 1*SEC;
