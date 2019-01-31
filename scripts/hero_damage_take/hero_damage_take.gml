var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

if (base_source != id){
	if (!status_immortal){
		var ratio = 0.25 + (0.75*(base_value/(my_autoshield_cooldown_treshold*status_health_max)));
		room_timespeed_temp(0.05, ratio*0.5*SEC, true);
		
		if (my_autoshield_cooldown_timer <= 0){
			//base_value = 1;
			my_autoshield_cooldown_timer = my_autoshield_cooldown_value;
			actor_buff_apply("immortal", my_autoshield_duration, [], "autoshield");
			room_timespeed_temp(0.05, 1*SEC, true);
			var bullet = hero_action_repel(1, 1.5, 420, 80);	
			bullet.draw_blend_temporary_style = "solid";
			bullet.draw_blend_temporary_color = make_color_rgb(180,180,0);
			bullet.draw_blend_temporary_duration = INFINITY;
			base_lethal = false;
		} else {
			if (my_autoshield_cooldown_timer > 0){
				var shield_gain = (base_value/(my_autoshield_cooldown_treshold*status_health_max))
				my_autoshield_cooldown_timer = max(my_autoshield_cooldown_timer - (shield_gain*my_autoshield_cooldown_value), 0);
			}
		}
		
		if (status_health_current - base_value <= 0 && my_grit_cooldown_timer <= 0 && base_lethal){
			my_grit_cooldown_timer = my_grit_cooldown_value;
			actor_buff_apply("immortal", my_grit_duration, [], "autoshield");
			actor_buff_apply("damage_bonus_percent", my_grit_duration*2.5, [100], "grit_attacc");
			room_timespeed_temp(0.05, 1.5*SEC, true);
			var bullet = hero_action_repel(2, 3, 780, 120);
			bullet.draw_blend_temporary_style = "solid";
			bullet.draw_blend_temporary_color = make_color_rgb(255,0,0);
			bullet.draw_blend_temporary_duration = INFINITY;
			base_lethal = false;
		}
	}
}

return [base_source, base_value, base_lethal];