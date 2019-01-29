var type = argument0[0];
var duration = argument0[1];
var arguments = argument0[2];
var buff_id = argument0[3];
		
switch(type){
	case "speed_bonus_raw":
		var value = arguments[0];
		status_movespeed_total += value;
		break
			
	case "speed_bonus_percent":
		var value = arguments[0];
		status_movespeed_total += (value/100)*status_movespeed_base;
		break
		
	case "damage_bonus_raw":
		var value = arguments[0];
		status_damage_total += value;
		break
		
	case "damage_bonus_percent":
		var value = arguments[0];
		status_damage_total += (value/100)*status_damage_base;
		break
		
	case "armor_poise":
		var value = arguments[0];
		status_armor_poise = (status_armor_poise + ((100 - status_armor_poise)*(value/100)));
		break
		
	case "armor_health":
		var value = arguments[0];
		status_armor_health = (status_armor_health + ((100 - status_armor_health)*(value/100)));
		break
}