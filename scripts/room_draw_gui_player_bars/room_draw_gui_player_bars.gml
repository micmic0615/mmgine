var me = id;

var screen_width = window_get_width();
var screen_height = window_get_height();

var bar_length = 399
var bar_color = make_colour_rgb(90,0,0);
var bar_width = bar_length;
var bar_height = 20;
var bar_loc_x = (screen_width/2) - (bar_length/2);
var bar_loc_y = screen_height - 46;

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
draw_text_transformed(bar_loc_x + (bar_length/2), bar_loc_y + (bar_height/2) - 3, hp_text, 0.8, 0.8, 0);

var bar_shield_height = 82;
var bar_shield_width = 10;
var bar_shield_x = (screen_width/2) + (bar_length/2) + 5;
var bar_shield_y = screen_height - (bar_shield_height + 9);

var bar_shield_color = make_color_rgb(0,45,45)
draw_rectangle_color(bar_shield_x, bar_shield_y, bar_shield_x + bar_shield_width, bar_shield_y + bar_shield_height, bar_shield_color, bar_shield_color, bar_shield_color, bar_shield_color, false);


var shield_ratio = (player_main_actor.my_autoshield_cooldown_timer/player_main_actor.my_autoshield_cooldown_value);
bar_shield_height = 82 * (1 - shield_ratio);
bar_shield_color = make_color_rgb(60,255,255)
bar_shield_y += shield_ratio*82
draw_rectangle_color(bar_shield_x, bar_shield_y, bar_shield_x + bar_shield_width, bar_shield_y + bar_shield_height, bar_shield_color, bar_shield_color, bar_shield_color, bar_shield_color, false)


var bar_shield_height = 82;
var bar_shield_width = 10;
var bar_shield_x = (screen_width/2) - (bar_length/2) - (bar_shield_width*2) + 5;
var bar_shield_y = screen_height - (bar_shield_height + 9);

var bar_shield_color = make_color_rgb(60,20,0)
draw_rectangle_color(bar_shield_x, bar_shield_y, bar_shield_x + bar_shield_width, bar_shield_y + bar_shield_height, bar_shield_color, bar_shield_color, bar_shield_color, bar_shield_color, false);


if (player_main_actor.my_bloodlust_active_timer > 0){
	var shield_ratio = 1 - (player_main_actor.my_bloodlust_active_timer/player_main_actor.my_bloodlust_active_value);
	bar_shield_height = 82 * (1 - shield_ratio);
	bar_shield_color = make_color_rgb(240,80,0)
} else {
	var shield_ratio = 1 - (player_main_actor.my_bloodlust_trigger_timer/player_main_actor.my_bloodlust_trigger_treshold);
	bar_shield_height = 82 * (1 - shield_ratio);
	bar_shield_color = make_color_rgb(160,40,0)
}



bar_shield_y += shield_ratio*82
draw_rectangle_color(bar_shield_x, bar_shield_y, bar_shield_x + bar_shield_width, bar_shield_y + bar_shield_height, bar_shield_color, bar_shield_color, bar_shield_color, bar_shield_color, false)

	