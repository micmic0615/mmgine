var type = argument0[0];
var duration = argument0[1];
var arguments = argument0[2];
var buff_id = argument0[3];
		
switch(type){
	case "flinched":
		actor_actions_enabled = false;
		status_movespeed_total = 0;
		break
	
	case "stunned":
		actor_actions_enabled = false;
		status_movespeed_total = 0;
		break
		
	case "rooted":
		status_movespeed_total = 0;
		break
		
	case "silenced":
		actor_actions_enabled = false;
		break
		
	case "immortal":
		status_immortal = true;
		break
}