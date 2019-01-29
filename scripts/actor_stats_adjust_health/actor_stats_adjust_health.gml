var new_health = argument0;
var prev_health = status_health_max;

status_health_max = new_health;
status_health_current = min(round((new_health/prev_health) * status_health_current), status_health_max)