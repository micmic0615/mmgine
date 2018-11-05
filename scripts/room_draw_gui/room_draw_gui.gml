room_run_scripts("draw_gui");

if (global.replay_mode == "play"){
	var screen_width = window_get_width()
	var screen_height = window_get_height()
	
	draw_set_colour(make_color_rgb(100,100,100));
	draw_rectangle(20, screen_height - 30, 20 + (screen_width - 40), screen_height - 20, false);
	
	var duration = min(room_age_real/global.replay_duration,1);
	
	draw_set_colour(make_color_rgb(200,200,100));
	draw_rectangle(20, screen_height - 30, 20 + (screen_width - 40)*duration, screen_height - 20, false);
}