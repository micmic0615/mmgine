var can_move = argument0;

switch(my_invoke_boss_phase){
	case 0:
		if (status_health_current/status_health_max < 0.65){
			can_move = !action_invoke_trigger(id)
		}
		break
		
	case 1:
		if (status_health_current/status_health_max < 0.3){
			can_move = !action_invoke_trigger(id)
		}
		break
}

return can_move