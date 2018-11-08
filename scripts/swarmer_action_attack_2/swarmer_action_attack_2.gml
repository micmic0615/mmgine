var target_point = argument0;

if (my_dash_cooldown_timer <= 0){	
	entity_motion_push((my_dash_range), (my_dash_speed/(my_dash_range*PPS))*SEC, angle_between(target_point[0], target_point[1], x, y),  ["multiply",1.25], "mana_dash");
	my_dash_cooldown_timer = my_dash_cooldown_value;
}