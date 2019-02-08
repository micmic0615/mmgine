var action_map = argument0;

switch(action_map[?"action_name"]){
	case "dash":
	case "chase":
		my_dodge_timer = max(my_dodge_value,my_dodge_timer);
		break
	
	case "shoot":
		if (action_map[?"animation_cast"] == "channel_melee"){
			my_dodge_timer = max(my_dodge_action_disable, my_dodge_timer);
		} else {
			my_dodge_timer = max(my_dodge_poke_disable, my_dodge_timer);
		}
		break
	
	default:
		my_dodge_timer = max(my_dodge_action_disable, my_dodge_timer);
		
}