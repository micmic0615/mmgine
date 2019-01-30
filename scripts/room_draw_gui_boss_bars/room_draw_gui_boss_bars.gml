var me = id;

var screen_width = window_get_width();
var screen_height = window_get_height();

with(ACTOR){
	if (player_boss == true){
		var bar_length = (screen_width - 20);
		var bar_color = make_colour_rgb(90,0,0);
		var bar_width = bar_length;
		var bar_height = 22;
		var bar_loc_x = 10;
		var bar_loc_y = 10;

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
		bar_color = make_colour_rgb(255,255,255);
		bar_width = bar_length*(min(1,(draw_bar_health_damage/status_health_max)));

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
		bar_color = make_colour_rgb(255,0,0);
		bar_width = bar_length*(min(1,(status_health_current/status_health_max)));

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
			
		draw_set_font(fontArial)
		draw_text_transformed_colour(
			20, 
			11, 
			string(player_boss_name),
			16/12,
			15/12,
			0,
			c_white,
			c_white,
			c_white,
			c_white,
			1
		);
			
		bar_color = make_colour_rgb(50,50,50);
		bar_width = bar_length;
		bar_height = 6;
		bar_loc_y = 36;
			
		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
			
		var flinch_buff = actor_buff_find("flinched");
	
		if (flinch_buff == undefined){
			bar_color = make_colour_rgb(255,255,255);
			bar_width = bar_length*(min(1,(status_poise_current/status_poise_max)));
		} else {
			var random_yellow = random(200);
			bar_color = make_colour_rgb(200,200,random_yellow);
			bar_width = bar_length*(min(1,(flinch_buff[1]/status_flinch_duration)));
		}

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	}
}