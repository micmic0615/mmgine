var target_point = argument0;
var my_attack_combo_2_max = 3;


if (hero_can_act()){
	if (!my_time_stop_channel){
		if (my_attack_channel_power_current == my_attack_channel_power_max){
			my_attack_channel_power_current = 0;
			my_attack_cast_timer_4 = my_attack_cast_value_4;
			my_attack_delay_timer_4 = my_attack_delay_value_4;
			my_time_stop_trigger = true;
		}
		
	} else {
		my_time_stop_channel = false;
		actor_buff_apply("immortal", 0.5*SEC, [], "time_stop_immortal");
		entity_sfx_create(
			ExplosionBulletAlt_idle,
			0.5*SEC,
			0,
			0,
			make_color_rgb(0,255,255),
			0,
			1,
			1,
			id,
			"expand",
			[
				600,
				30
			]
		)
	}
}