my_invoke_boss_phase = 0;
my_invoke_cast_value = 3*SEC;
my_invoke_channel_value = 0.4*SEC;

my_invoke_color_1 = make_color_rgb(255,180,60);
my_invoke_color_2 = make_color_rgb(255,40,120);

action_invoke_create([
	/*cast_value*/ my_invoke_cast_value,
	/*channel_value*/  my_invoke_channel_value,
	/*backswing_value*/ 1.5*SEC,
	/*cooldown_value*/ 0,
	/*animation_cast*/ "charge",
	/*animation_channel*/ "super",
	/*animation_backswing*/ "idle",
]);
