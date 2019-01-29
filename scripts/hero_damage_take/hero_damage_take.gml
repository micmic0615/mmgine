var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];

if (base_source != id){
	if (!status_immortal){
		var ratio = base_value/(my_autoshield_cooldown_treshold*status_health_max);
		
		room_timespeed_temp(0.05, ratio*0.5*SEC, true);
		
		if (my_autoshield_cooldown_timer > 0){
			my_autoshield_cooldown_timer = max(my_autoshield_cooldown_timer - (ratio*my_autoshield_cooldown_value), 0);
		}
		
		if (my_autoshield_cooldown_timer <= 0){
			my_autoshield_cooldown_timer = my_autoshield_cooldown_value;
			actor_buff_apply("immortal", my_autoshield_duration, [], "autoshield");
			room_timespeed_temp(0.05, 1*SEC, true);
			hero_action_repel(1.25, 3, 420, 120);	
			base_lethal = false;
		}
		
		if (status_health_current - base_value <= 0 && my_grit_cooldown_timer <= 0 && base_lethal){
			my_grit_cooldown_timer = my_grit_cooldown_value;
			actor_buff_apply("immortal", my_grit_duration, [], "autoshield");
			actor_buff_apply("damage_bonus_percent", my_grit_duration*2, [100], "grit_attacc");
			room_timespeed_temp(0.05, 1.5*SEC, true);
			var bullet = hero_action_repel(2.5, 6, 840, 240);
			bullet.draw_blend_temporary_style = "solid";
			bullet.draw_blend_temporary_color = c_red;
			bullet.draw_blend_temporary_duration = INFINITY;
			base_lethal = false;
		}
	}
}

return [base_source, base_value, base_lethal];