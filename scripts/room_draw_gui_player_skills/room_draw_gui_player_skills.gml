var me = id;

var screen_width = window_get_width();
var screen_height = window_get_height();

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
	