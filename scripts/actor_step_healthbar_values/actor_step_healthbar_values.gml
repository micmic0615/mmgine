var draw_bar_health_damage_speed = (20/100)*status_health_max*PPS;
if (draw_bar_health_damage + draw_bar_health_damage_speed > status_health_current){
	draw_bar_health_damage -= draw_bar_health_damage_speed
} else if (draw_bar_health_damage - draw_bar_health_damage_speed < status_health_current){
	draw_bar_health_damage += draw_bar_health_damage_speed
} else {
	draw_bar_health_damage = status_health_current
}