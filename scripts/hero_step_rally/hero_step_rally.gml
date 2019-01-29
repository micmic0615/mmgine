if (my_rally_limit > status_health_current){
	my_rally_limit = max(status_health_current, my_rally_limit - (my_rally_decay*TIMESPEED))
} else if (my_rally_limit < status_health_current){
	my_rally_limit = status_health_current
}