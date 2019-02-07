my_chase_distance = 240
my_chase_movespeed_set = 240*PPS;
my_chase_movesnap_set = 0.1*SEC;
my_chase_channel_value = 6*SEC;
my_chase_cooldown_value = 7*SEC;
my_chase_color = make_color_rgb(255,80,80);

my_chase_dash_timer = 0;
my_chase_dash_value = 0.25*SEC;

action_chase_create([	
	/*color"*/ my_chase_color,
	/*distance"*/ my_chase_distance,
	/*movespeed_set"*/ my_chase_movespeed_set,
	/*movesnap_set"*/ my_chase_movesnap_set,
	/*cast_value"*/ 0,
	/*channel_value"*/ my_chase_channel_value,
	/*backswing_value"*/ 0,
	/*cooldown_value"*/ my_chase_cooldown_value,
])
