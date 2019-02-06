my_dash_speed = 640*PPS;
my_dash_range = 1080;
my_dash_channel = 0.15*SEC;
my_dash_cooldown = 0.75*SEC
my_dash_combo_max = 1;
my_dash_flair_color = make_color_rgb(160,160,160);

action_dash_create([	
	/*"color"*/ my_dash_flair_color,
	/*"speed"*/ my_dash_speed,
	/*"range"*/ my_dash_range,
	/*"combo_max"*/ my_dash_combo_max,
	/*"cast_value"*/ 0,
	/*"channel_value"*/ my_dash_channel,
	/*"backswing_value"*/ 0,
	/*"cooldown_value"*/ my_dash_cooldown,
]);