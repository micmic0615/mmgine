my_dash_speed = 540*PPS;
my_dash_range = 420;
my_dash_charge_cost = 0;
my_dash_channel = 0.2*SEC;
my_dash_cooldown_value = 1*SEC
my_dash_combo_max = 9;
my_dash_flair_color = make_color_rgb(200,200,200);

action_dash_create([
	/*speed*/ my_dash_speed,
	/*range*/ my_dash_range,
	/*channel_value*/ my_dash_channel,
	/*cooldown_value*/ my_dash_cooldown_value,
	/*combo_max*/ my_dash_combo_max,
	/*flair_color*/ my_dash_flair_color
]);