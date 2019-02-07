draw_set_font(fontArial)
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (global.draw_tips){
	
	draw_text_color(10,10, "use WASD to move", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,30, "use left and right click to attack", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,50, "use spacebar to dash", c_white, c_white, c_white, c_white, 1);	
	draw_text_color(10,70, "hold R to heal", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,90, "hold shift to enter aim mode", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,110, "use left and right arrow keys to select a skill slot", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,130,"use up and down arrow keys to change the skill in the selected slot", c_white, c_white, c_white, c_white, 1);

	draw_text_color(10,170,"press num keys 1-7 to spawn enemies (each number spawns a different enemy)", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,190,"press 0 to spawn random enemy", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,210,"press 9 to spawn a boss enemy", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,230,"press backspace to kill all enemies", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,250,"press escape to reset room", c_white, c_white, c_white, c_white, 1);
	draw_text_color(10,270,"press enter to toggle tips", c_white, c_white, c_white, c_white, 1);

	levelproto00_draw_gui_tips(330);
}


var enemy_count = 0;
var kill_count = 0;
if (player_main_actor != noone && instance_exists(player_main_actor)){
	var hero = player_main_actor;
	with(ACTOR){
		if (
			player_faction != hero.player_faction && 
			(
				!variable_instance_exists(id, "action_clone_original") ||
				(variable_instance_exists(id, "action_clone_original") && action_clone_original)
			)
		){
			enemy_count++;
		}
	}
	
	kill_count = hero.records_kills
}


draw_set_halign(fa_right)
var screen_width = window_get_width();
draw_text_color(screen_width - 10, 10,"OBJECTS: " + string(instance_number(ENTITY)), c_white, c_white, c_white, c_white, 1);
draw_text_color(screen_width - 10, 30,"FPS: " + string(fps), c_white, c_white, c_white, c_white, 1);

draw_text_color(screen_width - 10, 70,"ENEMIES: " + string(enemy_count), c_white, c_white, c_white, c_white, 1);
draw_text_color(screen_width - 10, 90,"KILLS: " + string(kill_count), c_white, c_white, c_white, c_white, 1);
