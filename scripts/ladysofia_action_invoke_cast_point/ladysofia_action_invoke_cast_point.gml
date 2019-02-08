my_invoke_boss_phase += 1;

var buff_duration = 5*SEC;
actor_buff_apply("regen_poise", buff_duration, [status_poise_max/buff_duration], "invoke_poise_restore");
actor_buff_apply("regen_health", buff_duration*2, [(status_health_max*0.15)/(buff_duration*2)], "invoke_health_restore");
actor_buff_apply("armor_health", buff_duration, [50], "invoke_poise_defense");
actor_buff_apply("armor_poise", INFINITY, [25], "invoke_poise_armor_" + string(my_invoke_boss_phase));

switch(my_invoke_boss_phase){
	case 1:
		my_barrage_bullet_radius = 280;
		my_barrage_bullet_speed = 1150*PPS;
		my_barrage_bullet_range = 1050;
		my_barrage_particles = [[game_particle_setup_basic(my_invoke_color_1, 1, 0.35, 0.25*SEC), 12, my_barrage_bullet_radius*0.5]];
		
		my_strike_color = my_invoke_color_1;
		my_strike_cast_aim_limit = 0.7*SEC;
		my_strike_speed =  2100*PPS;
		
		break;
		
	case 2:
		my_barrage_bullet_radius = 320;
		my_barrage_bullet_speed = 1400*PPS;
		my_barrage_bullet_range = 1200;
		my_barrage_particles = [[game_particle_setup_basic(my_invoke_color_2, 1, 0.35, 0.25*SEC), 12, my_barrage_bullet_radius*0.5]];
		
		my_strike_color = my_invoke_color_2;
		my_strike_cast_aim_limit = 0.6*SEC;
		my_strike_speed =  2400*PPS;
		
		break;
}

action_barrage[?"bullet_radius"] = my_barrage_bullet_radius;
action_barrage[?"bullet_speed"] = my_barrage_bullet_speed;
action_barrage[?"bullet_range"] = my_barrage_bullet_range;
action_barrage[?"bullet_particles"] = my_barrage_particles;


action_strike[?"color"] = my_strike_color;
action_strike[?"speed"] = my_strike_speed;
action_strike[?"cast_aim_limit"] = my_strike_cast_aim_limit;
action_strike[?"channel_value"] = my_strike_range/(my_strike_speed*my_strike_dash_multiply);