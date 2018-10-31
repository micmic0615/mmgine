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
}