var me = id;
if (player_main_actor != noone && instance_exists(player_main_actor)){
	var screen_width = window_get_width();
	var screen_height = window_get_height();
	
	var bar_color = make_colour_rgb(90,0,0);
	var bar_width = 300;
	var bar_height = 10;
	var bar_loc_x = 10;
	var bar_loc_y = screen_height - 30;

	draw_set_colour(bar_color);
	draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
	bar_color = make_colour_rgb(255,255,255);
	bar_width = 300*(min(1,(player_main_actor.draw_bar_health_damage/player_main_actor.status_health_max)));

	draw_set_colour(bar_color);
	draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
	bar_color = make_colour_rgb(255,0,0);
	bar_width = 300*(min(1,(player_main_actor.status_health_current/player_main_actor.status_health_max)));

	draw_set_colour(bar_color);
	draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
	
	bar_loc_y += 14;
	bar_height = 5;
	bar_color = make_colour_rgb(50,50,50);
	bar_width = 300;
		
	draw_set_colour(bar_color);
	draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
	var flinch_buff = undefined;
	with(player_main_actor){flinch_buff = actor_buff_find("flinched")}
	
	if (flinch_buff == undefined){
		bar_color = make_colour_rgb(255,255,255);
		bar_width = 300*(min(1,(player_main_actor.status_poise_current/player_main_actor.status_poise_max)));
	} else {
		var random_yellow = random(200);
		bar_color = make_colour_rgb(200,200,random_yellow);
		bar_width = 300*(min(1,(flinch_buff[1]/player_main_actor.status_flinch_duration)));
	}

	draw_set_colour(bar_color);
	draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
	
	
	
	
	
	
	
	
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