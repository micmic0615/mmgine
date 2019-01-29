draw_set_font(fontArial)
draw_set_halign(fa_left);
draw_set_valign(fa_top)
draw_text_color(10,10, "use wasd to move", c_white, c_white, c_white, c_white, 1);
draw_text_color(10,30, "use left and right click to attack", c_white, c_white, c_white, c_white, 1);
draw_text_color(10,50, "use spacebar to dash", c_white, c_white, c_white, c_white, 1);
draw_text_color(10,70, "hold shift to enter aim mode", c_white, c_white, c_white, c_white, 1);
draw_text_color(10,90, "use left and right arrow keys to select a skill slot", c_white, c_white, c_white, c_white, 1);
draw_text_color(10,110,"use up and down arrow keys to change the skill in the selected slot", c_white, c_white, c_white, c_white, 1);

draw_text_color(10,150,"press enter to spawn a dummy enemy", c_white, c_white, c_white, c_white, 1);
draw_text_color(10,170,"press escape to reset all enemy spawns", c_white, c_white, c_white, c_white, 1);

var enemy_count = 0;
var kill_count = 0;
if (player_main_actor != noone && instance_exists(player_main_actor)){
	var hero = player_main_actor;
	with(ACTOR){
		if (player_faction != hero.player_faction){
			enemy_count++;
		}
	}
	
	kill_count = hero.records_kills
}


draw_set_halign(fa_right)
var screen_width = window_get_width();

draw_text_color(screen_width - 10, 10,"ENEMIES: " + string(enemy_count), c_white, c_white, c_white, c_white, 1);
draw_text_color(screen_width - 10, 30,"KILLS: " + string(kill_count), c_white, c_white, c_white, c_white, 1);