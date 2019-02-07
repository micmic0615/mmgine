my_chase_distance = 120
my_chase_movespeed_set = 1840*PPS;
my_chase_movesnap_set = 0.25*SEC;
my_chase_channel_value = 3*SEC;
my_chase_cooldown_value = 6*SEC;
my_chase_color = make_color_rgb(25,175,255);

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
