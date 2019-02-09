my_dash_speed = 540*PPS;
my_dash_range = 420;
my_dash_combo_max = 9;
my_dash_color = make_color_rgb(200,200,200);
my_dash_auto_dodge_cooldown_value = 1.5*SEC;

action_dash_create([	
	/*color*/ my_dash_color,
	/*speed*/ my_dash_speed,
	/*range*/ my_dash_range,
	/*combo_max*/ my_dash_combo_max,
	/*iframe_duration*/0,
	/*auto_dodge_enabled*/ true,
	/*auto_dodge_cooldown_value*/ my_dash_auto_dodge_cooldown_value,
	/*auto_dodge_range_min*/ 160,
	/*auto_dodge_range_max*/ 340,
	/*cast_value*/ 0,
	/*channel_value*/ 0.2*SEC,
	/*backswing_value*/ 0,
	/*cooldown_value*/ 1*SEC,
]);