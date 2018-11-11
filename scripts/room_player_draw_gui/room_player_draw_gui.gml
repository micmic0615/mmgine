var me = id;
if (player_main_actor != noone && instance_exists(player_main_actor)){
	var screen_width = window_get_width();
	var screen_height = window_get_height();
	
	#region //HEALTH BARS
		var bar_length = 400
		var bar_color = make_colour_rgb(90,0,0);
		var bar_width = bar_length;
		var bar_height = 15;
		var bar_loc_x = (screen_width/2) - (bar_length/2);
		var bar_loc_y = screen_height - 35;

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
		
		
		bar_color = make_colour_rgb(255,170,0);
		bar_width = bar_length*(min(1,(player_main_actor.my_rally_limit/player_main_actor.status_health_max)));
		
		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
		bar_color = make_colour_rgb(255,255,255);
		bar_width = bar_length*(min(1,(player_main_actor.draw_bar_health_damage/player_main_actor.status_health_max)));

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
		bar_color = make_colour_rgb(255,0,0);
		bar_width = bar_length*(min(1,(player_main_actor.status_health_current/player_main_actor.status_health_max)));

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
	
		bar_loc_y += 19;
		bar_height = 8;
		bar_color = make_colour_rgb(50,50,50);
		bar_width = bar_length;
		
		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
		
		bar_color = make_colour_rgb(180,50,180);
		
		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width/2, bar_loc_y + bar_height, false);
	
		var flinch_buff = undefined;
		with(player_main_actor){flinch_buff = actor_buff_find("flinched")}
	
		if (flinch_buff == undefined){
			bar_color = make_colour_rgb(255,255,255);
			var poise_ratio = player_main_actor.status_poise_current/player_main_actor.status_poise_max;
			if (poise_ratio >= 0.5){
				var random_blink = random(100);
				bar_color = random_blink > 50 ? make_colour_rgb(255,200,255) : make_colour_rgb(255,255,255);
			}
			
			bar_width = bar_length*(min(1,(poise_ratio)));
		} else {
			var random_yellow = random(200);
			bar_color = make_colour_rgb(200,200,random_yellow);
			bar_width = bar_length*(min(1,(flinch_buff[1]/player_main_actor.status_flinch_duration)));
		}

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	#endregion
	
	//#region //SKILLS
	//	var skill_count = 5;
	//	var icon_width = 40;
	//	var icon_height = 40;
	//	var icon_gap = 5;
	//	var icon_loc_x = (screen_width/2);
	//	var icon_loc_y = screen_height - 80;
	//	while(skill_count > 0){
	//		skill_count--;
	//		var icon_x = icon_loc_x - (skill_count*(icon_width+icon_gap)) + (icon_width+icon_gap)*1.5;
	//		draw_set_colour(make_colour_rgb(100,100,100));
	//		draw_rectangle(icon_x, icon_loc_y, icon_x + icon_width, icon_loc_y + icon_height, false);
	//	}
	//#endregion
	
	
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
	
	
	
	var room_max = max(room_width,room_height);
	var room_min = min(room_width,room_height)
	
	var minimap_size = 160;
	var minimap_margin = 10
	var minimap_sizemargin = minimap_size + minimap_margin;
	
	var minimap_center_x = screen_width - minimap_sizemargin + minimap_size/2;
	var minimap_center_y = screen_height - minimap_sizemargin + minimap_size/2;
	
	draw_set_color(make_color_rgb(255,255,255))
	draw_set_alpha(0.25);
	draw_rectangle(screen_width - minimap_sizemargin, screen_height - minimap_sizemargin, screen_width - minimap_margin, screen_height - minimap_margin, false);
	draw_set_alpha(0.65);
	
	draw_set_color(make_color_rgb(0,255,255))
	draw_circle(minimap_center_x, minimap_center_y, 2, false);
	
	with(ACTOR){
		if (id != me.player_main_actor){
			var x_offset = ((x - me.player_main_actor.x)/room_max) * (minimap_size*1.2);
			var y_offset = ((y - me.player_main_actor.y)/room_max) * (minimap_size*1.2);
			
			var position_x = minimap_center_x + x_offset;
			var position_y = minimap_center_y + y_offset;
			
			if (
				(position_x > screen_width - minimap_sizemargin && position_x < screen_width - minimap_margin) &&
				(position_y > screen_height - minimap_sizemargin && position_y < screen_height - minimap_margin)
			){				
				draw_set_color(make_color_rgb(255, (me.player_faction != player_faction) ? 0 : 255, 0));
				with(me){draw_circle(position_x,position_y, 1.5, false)};
			}
		}
	}
	
	draw_set_alpha(1);
}