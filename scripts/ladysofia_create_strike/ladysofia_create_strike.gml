my_strike_color = make_color_rgb(60,255,120);
my_strike_speed =  1800*PPS;
my_strike_range = 1800;
my_strike_radius = 420;
my_strike_cast_value = 1.3*SEC;

action_strike_create([
	/*color*/ my_strike_color,
	/*speed*/ my_strike_speed,
	/*range*/ my_strike_range,
	/*radius*/ my_strike_radius,
	/*damage*/ [1.5,0],
	/*flinch*/ [1.25,0],
	/*push*/ [-100,0],
	/*dash_multiply*/ 1.075,
	/*cast_aim_limit*/ 0.65*SEC,
	/*cast_value*/ my_strike_cast_value,
	/*channel_value*/  my_strike_range/my_strike_speed,
	/*backswing_value*/ 0.5*SEC,
	/*cooldown_value*/ 1*SEC
]);

action_strike[?"animation_cast"] = "channel_strike";
action_strike[?"animation_channel"] = "attack_strike";
action_strike[?"animation_backswing"] = "rest";