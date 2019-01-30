var mc = player_main_actor;

var start_height = argument0;
var active_skill = argument1;


var skill_tooltip_description = "";

switch(active_skill){
	case "do":
		skill_tooltip_description = "Slightly improves the core attack by itself.";
		break
		
	case "split":
		skill_tooltip_description = "Splits the core attack into 2 or more bullets.  Reduces the damage of the individual bullets.";
		break
		
	case "ping":
		skill_tooltip_description = "Increases the fire rate your core attack.";
		break
		
	case "crash":
		skill_tooltip_description = "Increases the flinch rate your core attack.";
		break
	
	case "load":
		skill_tooltip_description = "Adds an explosion to your core attack.";
		break
		
	case "breach":
		skill_tooltip_description = "Adds penetration to your core attack.  Increases the range on some core attacks.";
		break
		
	case "focus":
		skill_tooltip_description = "Improves the damage/flinch/cast-point multipliers of your charge attack.  Automatically fires a fully charged bullet every X attacks on some abilities.";
		break
		
}

draw_text_color(10,start_height, skill_tooltip_description, c_white, c_white, c_white, c_white, 1);