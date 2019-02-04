var mc = player_main_actor;

var start_height = argument0;
var active_skill = argument1;


var skill_tooltip_description = "";

switch(active_skill){
	case "do":
		skill_tooltip_description = "Increases Health";
		break
		
	case "split":
		skill_tooltip_description = "Quadruple-dash.";
		break
		
	case "ping":
		skill_tooltip_description = "Adds a temporary speed-buff after dashing. Dash will consume some attack charge.";
		break
		
	case "crash":
		skill_tooltip_description = "Increases Poise.";
		break
	
	case "load":
		skill_tooltip_description = "Dashing causes an explosion. Dash will consume some attack charge.";
		break
		
	case "breach":
		skill_tooltip_description = "Increases dash distance.";
		break
		
	case "focus":
		skill_tooltip_description = "Reduces the time it takes to fully charge your shots.";
		break
		
}

draw_text_color(10,start_height, skill_tooltip_description, c_white, c_white, c_white, c_white, 1);