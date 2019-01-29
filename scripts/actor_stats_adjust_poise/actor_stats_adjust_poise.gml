var new_poise = argument0;
var prev_poise = status_poise_max;

status_poise_max = new_poise;
status_poise_current = min(round((new_poise/prev_poise) * status_poise_current), status_poise_max)