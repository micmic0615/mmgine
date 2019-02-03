my_chase_distance = 30
my_chase_movespeed_set = 1000*PPS;
my_chase_movesnap_set = 0.5*SEC;
my_chase_active_value = 7*SEC;
my_chase_cooldown_value = 10*SEC;
my_chase_color = make_color_rgb(255,30,90);


my_chase_delay_timer = 0;
my_chase_delay_value = 0.05*SEC;

my_chase_success_validation = false;

action_chase_create([
	/*distance*/ my_chase_distance,
	/*movespeed_set*/ my_chase_movespeed_set,
	/*movesnap_set*/ my_chase_movesnap_set,
	/*active_value*/ my_chase_active_value,
	/*cooldown_value*/ my_chase_cooldown_value,
	/*color*/ my_chase_color
])