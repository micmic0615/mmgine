my_dash_speed = 580*PPS;
my_dash_range = 340;
my_dash_charge_cost = 0;
my_dash_poise_cost = 0;
my_dash_channel = 0.1*SEC;
my_dash_cooldown_value = 1*SEC
my_dash_combo_max = 2;
my_dash_color = make_color_rgb(200,200,200);

my_dash_cancel_cooldown_timer = 0;
my_dash_cancel_cooldown_value = 1.5*SEC;

action_dash_create([	
	/*color*/ my_dash_color,
	/*speed*/ my_dash_speed,
	/*range*/ my_dash_range,
	/*combo_max*/ my_dash_combo_max,
	/*iframe_duration*/ 0.2*SEC,
	/*auto_dodge_enabled*/ false,
	/*auto_dodge_cooldown_value*/ 0,
	/*auto_dodge_range_min*/ 0,
	/*auto_dodge_range_max*/ 0,
	/*cast_value*/ 0,
	/*channel_value*/ my_dash_channel,
	/*backswing_value*/ 0,
	/*cooldown_value*/ my_dash_cooldown_value,
]);

if (ROOM.player_main_actor != id){
	my_dash_poise_cost = 0.2;
	my_dash_speed = 480*PPS;
	my_dash_range = 280;
}