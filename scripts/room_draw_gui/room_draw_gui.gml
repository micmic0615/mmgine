room_run_scripts("draw_gui");

var screen_width = window_get_width()
var screen_height = window_get_height()
	
if (global.replay_mode == "play"){
	
	
	draw_set_colour(make_color_rgb(100,100,100));
	draw_rectangle(0, screen_height - 3, screen_width, screen_height, false);
	
	var duration = min(room_age_real/global.replay_duration,1);
	
	draw_set_colour(make_color_rgb(200,200,100));
	draw_rectangle(0, screen_height - 4, screen_width*duration, screen_height, false);
}

room_player_draw_gui();

if (screen_cover_text != undefined){
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0, 0, screen_width, screen_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext_transformed(screen_width/2, screen_height/2, screen_cover_text, 0, INFINITY, 3, 3, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
}

if (screen_cover_alpha > 0){
	draw_set_alpha(min(1, screen_cover_alpha));
	draw_set_color(screen_cover_color);
	draw_rectangle(0, 0, screen_width, screen_height, false);
	draw_set_alpha(1)
}