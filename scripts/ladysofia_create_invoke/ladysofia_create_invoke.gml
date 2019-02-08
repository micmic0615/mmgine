my_invoke_boss_phase = 0;
my_invoke_cast_value = 3*SEC;
my_invoke_channel_value = 0.4*SEC;
action_invoke_create([
	/*cast_value*/ my_invoke_cast_value,
	/*channel_value*/  my_invoke_channel_value,
	/*backswing_value*/ 1.5*SEC,
	/*cooldown_value*/ 0,
	/*animation_cast*/ "charge",
	/*animation_channel*/ "super",
	/*animation_backswing*/ "idle",
]);
