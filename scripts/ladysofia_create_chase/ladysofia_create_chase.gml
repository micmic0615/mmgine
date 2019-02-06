my_chase_distance = 240
my_chase_movespeed_set = 240*PPS;
my_chase_movesnap_set = 0.1*SEC;
my_chase_active_value = 6*SEC;
my_chase_cooldown_value = 3*SEC;
my_chase_color = make_color_rgb(255,80,80);

my_chase_dash_timer = 0;
my_chase_dash_value = 0.25*SEC;
my_chase_random = undefined;

action_chase_create([
	/*distance*/ my_chase_distance,
	/*movespeed_set*/ my_chase_movespeed_set,
	/*movesnap_set*/ my_chase_movesnap_set,
	/*active_value*/ my_chase_active_value,
	/*cooldown_value*/ my_chase_cooldown_value,
	/*color*/ my_chase_color
])