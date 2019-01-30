var mc = player_main_actor;

var start_height = argument0;
var active_skill = argument1;


var skill_tooltip_description = "";
var skill_tooltip_description_next = "";

switch(active_skill){
	case "do":
		skill_tooltip_description = "Slightly improves the core attack as if modified by itself.";
		skill_tooltip_description_next = "Fully stacks with core's self modification skill.";
		break
		
	case "split":
		skill_tooltip_description = "Splits the core attack into 2 or more bullets.";
		skill_tooltip_description_next = "Reduces the damage of each individual bullets."
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
		skill_tooltip_description = "Adds penetration to your core attack.";
		skill_tooltip_description_next = "Increases the range of some cores."
		break
		
	case "focus":
		skill_tooltip_description = "Improves the damage/flinch/cast-point/range modifiers of your charge shot.";
		skill_tooltip_description_next = "Fires a fully charged shot every X attacks on some cores.";
		break
		
}

draw_text_color(10,start_height, skill_tooltip_description, c_white, c_white, c_white, c_white, 1);
draw_text_color(10,start_height + 20, skill_tooltip_description_next, c_white, c_white, c_white, c_white, 1);