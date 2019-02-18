var mc = player_main_actor;

var start_height = argument0;
var active_skill = argument1;


var skill_tooltip_description = "";

switch(active_skill){
	case "do":
		skill_tooltip_description = "Basic attack. Well-rounded.";
		break
		
	case "split":
		skill_tooltip_description = "Fires a cluster of mid-ranged bullets that spread as it travels.";
		break
		
	case "ping":
		skill_tooltip_description = "Low-damage attack that has good fire-rate and decent range.";
		break
		
	case "crash":
		skill_tooltip_description = "High cast-point, short ranged attack that deals massive poise damage.";
		break
	
	case "load":
		skill_tooltip_description = "Fires a bomb that explodes in a massive area. Enemies hit by the bomb/bullet's impact take reduced damage.";
		break
		
	case "breach":
		skill_tooltip_description = "High-range, penetrating attack.";
		break
		
	case "focus":
		skill_tooltip_description = "A slightly weaker basic attack that automatically fires a fully charged shot every 3 attacks.";
		break
		
}

draw_text_color(10,start_height, skill_tooltip_description, c_white, c_white, c_white, c_white, 1);