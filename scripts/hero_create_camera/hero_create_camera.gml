my_camera_zoom_speed = 0.1*PPS;

my_camera_zoom_min = 0.85;
my_camera_zoom_aim = 0.75;
my_camera_zoom_max = 0.45;

my_camera_zoom_current = my_camera_zoom_min;

my_camera_threats = ds_create("list");
my_camera_cooldown_timer = 0;
my_camera_cooldown_value = 1*SEC;
