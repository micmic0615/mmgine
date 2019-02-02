#region //DRAW HEALTH BARS
	if (draw_bars){
		var bar_color = make_colour_rgb(90,0,0);
		var bar_width = sprite_width*draw_bar_health_xscale;
		var bar_height = 3;
		var bar_loc_x = x - sprite_width*draw_bar_health_xscale/2;
		var bar_loc_y = y - ((sprite_height/2) + 20) + draw_bar_health_y;

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
		bar_color = make_colour_rgb(255,255,255);
		bar_width = sprite_width*draw_bar_health_xscale*(min(1,(draw_bar_health_damage/status_health_max)));

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
		bar_color = make_colour_rgb(255,0,0);
		bar_width = sprite_width*draw_bar_health_xscale*(min(1,(status_health_current/status_health_max)));

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
		
		bar_loc_y += 6;
		bar_height = 2;
		bar_color = make_colour_rgb(50,50,50);
		bar_width = sprite_width*draw_bar_health_xscale;
		
		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
		
		var flinch_buff = actor_buff_find("flinched");
		if (flinch_buff == undefined){
			if (status_armor_poise >= 100){
				var random_teal = random(255);
				bar_color = make_colour_rgb(random_teal,random_teal,255);
			} else {
				bar_color = make_colour_rgb(255,255,255);
			}
			
			bar_width = sprite_width*draw_bar_health_xscale*(min(1,(status_poise_current/status_poise_max)));
			
		} else {
			var flinch_ratio = flinch_buff[1]/status_flinch_duration;
			
			if (flinch_ratio > 1){
				var random_yellow = ((entity_age mod (0.5*SEC))*6) + 75
				
				bar_color = make_colour_rgb(random_yellow,random_yellow,0);
			} else {
				bar_color = make_colour_rgb(170,170,0);
			}
			
			bar_width = sprite_width*draw_bar_health_xscale*(min(1,(flinch_ratio)));
		}

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
		
	}
#endregion

actor_action_module_run("draw");
entity_run_type_scripts("draw");