var type = argument0[0];
var duration = argument0[1];
var arguments = argument0[2];
var buff_id = argument0[3];
		
switch(type){
	case "movespeed_set_raw":
		var value = arguments[0];
		status_movespeed_total = value;
		break
		
	case "movesnap_set_raw":
		var value = arguments[0];
		status_movesnap_total = value;
		break
}