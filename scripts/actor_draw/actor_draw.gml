#region //DRAW HEALTH BARS
	if (draw_bars == true){
		var bar_color = make_colour_rgb(90,0,0);
		var bar_width = sprite_width*draw_bar_health_xscale;
		var bar_height = 3;
		var bar_loc_x = x - sprite_width*draw_bar_health_xscale/2;
		var bar_loc_y = y - ((sprite_height/2) + 20) + draw_bar_health_y;

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
		var bar_color = make_colour_rgb(255,255,255);
		var bar_width = sprite_width*draw_bar_health_xscale*(min(1,(draw_bar_health_damage/status_health_max)));

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
		var bar_color = make_colour_rgb(255,0,0);
		var bar_width = sprite_width*draw_bar_health_xscale*(min(1,(status_health_current/status_health_max)));

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	}
#endregion

entity_run_type_scripts("draw");