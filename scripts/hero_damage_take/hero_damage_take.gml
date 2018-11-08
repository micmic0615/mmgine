var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];


if (actor_buff_find("flinched") == undefined){
	my_shield_damage_accumulated += base_value;
	if (my_shield_damage_accumulated >= my_shield_damage_treshold){
		my_shield_damage_accumulated = 0;	
		base_value = 1;
		actor_buff_apply("immortal", 2.5*SEC, [], "on_hit_iframe");
		
		hero_shield_pulse(0.25, 400, 250);
		room_timespeed_temp(0.05, 0.5*SEC, true);
	}
}

if (status_health_current - base_value <= 0 && my_grit_cooldown_timer <= 0){
	base_lethal = false;
	actor_buff_apply("immortal", 5*SEC, [], "on_hit_iframe");
	my_grit_cooldown_timer = my_grit_cooldown_value;
	room_timespeed_temp(0.05, 1*SEC, true);
	
	hero_shield_pulse(1, 800, 500)
	
	
}

return [base_source, base_value, base_lethal];