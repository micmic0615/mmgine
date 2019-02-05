var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

if (base_source != id){
	if (!status_immortal){
		if (actor_buff_find("flinched") == undefined){
			if (base_value/status_health_max >= 0.2){
				room_timespeed_temp(0.05, 0.35*SEC, true);
			}
		}
		
		if (my_autoshield_cooldown_timer <= 0){
			entity_draw_text_following("protection!", [cos(degtorad(270))*25, sin(degtorad(270))*25], 1.5*SEC, c_white, 18);
			my_autoshield_cooldown_timer = my_autoshield_cooldown_value;
			actor_buff_apply("immortal", my_autoshield_duration, [], "autoshield");
			room_timespeed_temp(0.05, 1*SEC, true);
			var bullet = hero_action_repel(1, 0, 420, 80);	
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
			entity_draw_text_following("grit!", [cos(degtorad(270))*25, sin(degtorad(270))*25], 1.5*SEC, c_white, 18);
			my_grit_cooldown_timer = my_grit_cooldown_value;
			actor_buff_apply("immortal", my_grit_duration, [], "autoshield");
			actor_buff_apply("damage_bonus_percent", my_grit_duration*2.5, [100], "grit_attacc");
			room_timespeed_temp(0.05, 1.5*SEC, true);
			var bullet = hero_action_repel(2, 0, 780, 120);
			bullet.draw_blend_temporary_style = "solid";
			bullet.draw_blend_temporary_color = make_color_rgb(255,0,0);
			bullet.draw_blend_temporary_duration = INFINITY;
			base_lethal = false;
		}
	}
}

return [base_source, base_value, base_lethal];