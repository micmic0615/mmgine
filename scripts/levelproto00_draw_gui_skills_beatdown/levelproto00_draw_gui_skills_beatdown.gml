var mc = player_main_actor;

var start_height = argument0;
var active_skill = argument1;


var skill_tooltip_description = "";

switch(active_skill){
	case "do":
		skill_tooltip_description = "Fires a cluster of bullets that home into the stunned enemy";
		break
		
	case "split":
		skill_tooltip_description = "Fires a fan of bullets towards the stunned enemy";
		break
		
	case "ping":
		skill_tooltip_description = "Fires a barrage of bullets that seek random nearby enemies";
		break
		
	case "crash":
		skill_tooltip_description = "Extends the stun duration. Hitting the enemy during this extended stun fires a secondary bullet.";
		break
	
	case "load":
		skill_tooltip_description = "Fires an explosive bullet to the stunned enemy, damaging other enemies nearby.";
		break
		
	case "breach":
		skill_tooltip_description = "Summons a swarm that damages nearby enemies and eliminates their bullets.";
		break
		
	case "focus":
		skill_tooltip_description = "Upon stunning an enemy, all attacks for the next few seconds will be automatically fully charged.";
		break
		
}

draw_text_color(10,start_height, skill_tooltip_description, c_white, c_white, c_white, c_white, 1);