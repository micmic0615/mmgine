var me = id;
if (player_main_actor != noone && instance_exists(player_main_actor)){
	var screen_width = window_get_width();
	var screen_height = window_get_height();
	
	#region //HEALTH BARS
		var bar_length = 400
		var bar_color = make_colour_rgb(90,0,0);
		var bar_width = bar_length;
		var bar_height = 20;
		var bar_loc_x = (screen_width/2) - (bar_length/2);
		var bar_loc_y = screen_height - 46;

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
		
		
		//bar_color = make_colour_rgb(255,170,0);
		//bar_width = bar_length*(min(1,(player_main_actor.rally_limit/player_main_actor.status_health_max)));
		
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
		
		draw_set_font(fontGothic);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var hp_text = string(player_main_actor.status_health_current) + " / " + string(player_main_actor.status_health_max);
		draw_set_color(c_white)
		draw_text_transformed(bar_loc_x + (bar_length/2), bar_loc_y + (bar_height/2) - 5, hp_text, 1, 1, 0)
	
	
		bar_loc_y += 23;
		bar_height = 14;
		bar_color = make_colour_rgb(50,50,50);
		bar_width = bar_length;
		
		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
		
	
	
		var flinch_buff = undefined;
		with(player_main_actor){flinch_buff = actor_buff_find("flinched")}
	
		if (flinch_buff == undefined){
			bar_color = make_colour_rgb(255,255,255);
			var poise_ratio = player_main_actor.status_poise_current/player_main_actor.status_poise_max;
		
			
			bar_width = bar_length*(min(1,(poise_ratio)));
		} else {
			var random_yellow = random(200);
			bar_color = make_colour_rgb(200,200,random_yellow);
			bar_width = bar_length*(min(1,(flinch_buff[1]/player_main_actor.status_flinch_duration)));
		}

		draw_set_colour(bar_color);
		draw_rectangle(bar_loc_x, bar_loc_y, bar_loc_x + bar_width, bar_loc_y + bar_height, false);
		
		var hp_text = string(round(player_main_actor.status_poise_current)) + " / " + string(player_main_actor.status_poise_max);
		draw_set_color(c_black)
		draw_text_transformed(bar_loc_x + (bar_length/2), bar_loc_y + (bar_height/2) - 3, hp_text, 0.8, 0.8, 0)
		
	#endregion
	
	#region //SKILLS
		var mc = player_main_actor;
		if(mc.active && mc.alive){
			
			draw_set_font(fontGothic)
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			var icon_size = 37;		
			var icon_gap = 5;
			var icon_y = screen_height - 87;
			
			var aux_size = 25;
			var aux_y = screen_height - 75;
			var icon_distance = 130;
			var aux_count = 2;
			
			var icon_x = (screen_width/2) - (icon_size + (icon_gap/2))
			var label_width = (icon_size*2) + icon_gap;
			var label_height = 12;
			
			draw_set_colour(make_colour_rgb(80,80,80));
			draw_rectangle(icon_x, icon_y - label_height, icon_x + label_width, icon_y - 1, false);
			draw_set_color(c_black)
			draw_text_transformed(icon_x + (label_width/2), (icon_y - label_height) + (label_height/2) - 4, "core attack", 0.7, 0.7, 0)
		
			if (mc.my_shoot_mod_select == 5){draw_set_colour(make_colour_rgb(0,255,255))} else {draw_set_colour(make_colour_rgb(80,80,80))}
			var icon_x = (screen_width/2) - icon_distance + (aux_size+icon_gap)*(aux_count+1);
			draw_rectangle(icon_x, icon_y, icon_x + icon_size, icon_y + icon_size, false);
			draw_sprite_stretched(asset_get_index("HI_Skill_"+ mc.my_shoot_mod_1 +"_idle"), 0, icon_x+2, icon_y+2, icon_size-3, icon_size-3)
		
			var index = 0;
			while(aux_count >= 0){
				if (mc.my_shoot_mod_select == aux_count + 2){draw_set_colour(make_colour_rgb(0,255,255))} else {draw_set_colour(make_colour_rgb(80,80,80))}
				var icon_x = (screen_width/2) - icon_distance +(aux_size+icon_gap)*aux_count;
				draw_rectangle(icon_x, aux_y, icon_x + aux_size, aux_y + aux_size, false);
			
				var aux_name = ds_list_find_value(mc.my_shoot_aux_1, index);
				if (aux_name != undefined){
					draw_sprite_stretched(asset_get_index("HI_Skill_"+ aux_name +"_idle"), 0, icon_x+2, aux_y+2, aux_size-3, aux_size-3)
				}
			
				index++;
				aux_count--
			}
			
			var screen_width_offset = 4;
		
			var index = 2;
			var aux_count = 0;
			while(aux_count <= 2){
				if (mc.my_shoot_mod_select == index + 7){draw_set_colour(make_colour_rgb(0,255,255))} else {draw_set_colour(make_colour_rgb(80,80,80))}
				var icon_x = (screen_width/2) + screen_width_offset + icon_distance - (aux_size+icon_gap)*(aux_count + 1);
				draw_rectangle(icon_x, aux_y, icon_x + aux_size, aux_y + aux_size, false);
			
				var aux_name = ds_list_find_value(mc.my_shoot_aux_2, index);
				if (aux_name != undefined){
					draw_sprite_stretched(asset_get_index("HI_Skill_"+ aux_name +"_idle"), 0, icon_x+2, aux_y+2, aux_size-3, aux_size-3)
				}
			
				index--;
				aux_count++
			}
		
			if (mc.my_shoot_mod_select == 6){draw_set_colour(make_colour_rgb(0,255,255))} else {draw_set_colour(make_colour_rgb(80,80,80))}
			var icon_x = (screen_width/2) + screen_width_offset + icon_distance - ((aux_size+icon_gap)*(aux_count)) - (icon_size + icon_gap);
			draw_rectangle(icon_x, icon_y, icon_x + icon_size, icon_y + icon_size, false);
		
			draw_sprite_stretched(asset_get_index("HI_Skill_"+ mc.my_shoot_mod_2 +"_idle"), 0, icon_x+2, icon_y+2, icon_size-3, icon_size-3);
			
			
			var bd_size = 30;		
			var bd_y = screen_height - 80;
			
			var icon_x = (screen_width/2)  - icon_distance + ((bd_size+icon_gap)*-1)
			if (mc.my_shoot_mod_select == 1){draw_set_colour(make_colour_rgb(0,255,255))} else {draw_set_colour(make_colour_rgb(210,210,30))}			
			draw_rectangle(icon_x, bd_y, icon_x + bd_size, bd_y + bd_size, false);
			var bd_name = ds_list_find_value(mc.my_beatdown_list, 0);
			if (bd_name != undefined){
				draw_sprite_stretched(asset_get_index("HI_Skill_"+ bd_name +"_idle"), 0, icon_x+2, bd_y+2, bd_size-3, bd_size-3)
			}
			
			var icon_x = (screen_width/2)  - icon_distance + ((bd_size+icon_gap)*-2)			
			if (mc.my_shoot_mod_select == 0){draw_set_colour(make_colour_rgb(0,255,255))} else {draw_set_colour(make_colour_rgb(210,210,30))}
			draw_rectangle(icon_x, bd_y, icon_x + bd_size, bd_y + bd_size, false);
			var bd_name = ds_list_find_value(mc.my_beatdown_list, 1);
			if (bd_name != undefined){
				draw_sprite_stretched(asset_get_index("HI_Skill_"+ bd_name +"_idle"), 0, icon_x+2, bd_y+2, bd_size-3, bd_size-3)
			}
			
			var label_width = 65;
			var label_height = 10;
			var label_y = screen_height - 90;
			
			var label_height = 10;
			
			draw_set_colour(make_colour_rgb(210,210,30));
			draw_rectangle(icon_x, label_y, icon_x + label_width, label_y + label_height, false);
			draw_set_color(c_black)
			draw_text_transformed(icon_x + label_width/2, label_y + (label_height/2) - 3, "beatdown", 0.7, 0.7, 0)
			
			var icon_x = (screen_width/2) + screen_width_offset + icon_distance + ((bd_size+icon_gap)*1) 
			if (mc.my_shoot_mod_select == 11){draw_set_colour(make_colour_rgb(0,255,255))} else {draw_set_colour(make_colour_rgb(150,150,150))}
			draw_rectangle(icon_x, bd_y, icon_x + bd_size, bd_y + bd_size, false);
			var bd_name = ds_list_find_value(mc.my_passive_list, 1);
			if (bd_name != undefined){
				draw_sprite_stretched(asset_get_index("HI_Skill_"+ bd_name +"_idle"), 0, icon_x+2, bd_y+2, bd_size-3, bd_size-3)
			}
			
			var icon_x = (screen_width/2)  + screen_width_offset + icon_distance + ((bd_size+icon_gap)*0) 
			if (mc.my_shoot_mod_select == 10){draw_set_colour(make_colour_rgb(0,255,255))} else {draw_set_colour(make_colour_rgb(150,150,150))}			
			draw_rectangle(icon_x, bd_y, icon_x + bd_size, bd_y + bd_size, false);
			var bd_name = ds_list_find_value(mc.my_passive_list, 0);
			if (bd_name != undefined){
				draw_sprite_stretched(asset_get_index("HI_Skill_"+ bd_name +"_idle"), 0, icon_x+2, bd_y+2, bd_size-3, bd_size-3)
			}
			
			draw_set_colour(make_colour_rgb(150,150,150));
			draw_rectangle(icon_x, label_y, icon_x + label_width, label_y + label_height, false);
			draw_set_color(c_black)
			draw_text_transformed(icon_x + label_width/2, label_y + (label_height/2) - 3, "passive", 0.7, 0.7, 0)
		}
	#endregion
	
	
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