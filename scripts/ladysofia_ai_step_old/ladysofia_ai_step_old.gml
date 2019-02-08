//if (action_chase[?"success"]){
//	if (action_chase[?"target_entity"] != noone && entity_enabled(action_chase[?"target_entity"])){
//		ladysofia_ai_pick_special_attack();
//	} else {
//		action_chase[?"success"] = false;
//	}
//} else {
//	if (ai_step_attack_else_wander()){
//		var distance = distance_between(x,y,ai_target.x,ai_target.y);
		
//		if (distance > 2000){
//			action_chase[?"cooldown_timer"] = 0;
//		}
		
//		if (ai_ex_mode_timer > 0 ){
//			ai_ex_mode_timer -= TIMESPEED;
//			action_chase[?"cooldown_timer"] = min(action_chase[?"cooldown_timer"], 1*SEC);
//			ai_toss_internal_cooldown_value = 0;
			
//			var particount = 3;

//			while(particount > 0){
//				var p_spawn = 120;
//				var p_count = 1 + random(2);
//				var p_model = game_particle_setup_basic(make_color_rgb(255,60,70), (1 + random(2)), 0.35, 0.5*SEC);

//				part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
//				part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
//				particount --;
//			};
//		}
		
//		if (status_health_current < status_health_max*0.4 && ai_ex_mode_available){
//			ai_ex_mode_timer = ai_ex_mode_value
//			ai_ex_mode_available = false
//		}
		
//		if (
//			action_chase[?"cooldown_timer"] <= 0 && 
//			action_chase[?"channel_timer"] <= 0 && 
//			action_chase[?"cast_timer"] <= 0 && 
//			action_chase[?"sequence"] <= 0 && 
//			action_shoot[?"cooldown_timer"] <= 0 &&
			
//			action_shoot[?"cast_timer"] <= 0 &&
//			action_shoot[?"channel_timer"] <= 0 &&
//			action_strike[?"cast_timer"] <= 0 &&
//			action_strike[?"channel_timer"] <= 0 &&
//			action_barrage[?"cast_timer"] <= 0 &&
//			action_barrage[?"channel_timer"] <= 0 &&
			
//			action_shoot[?"sequence"] <= 0 && 
//			action_strike[?"sequence"] <= 0 && 
//			action_barrage[?"sequence"] <= 0 
//		){
//			action_chase_trigger(ai_target);	
//		} else {
//			if (
//				action_chase[?"channel_timer"] <= 0 && 
//				action_strike[?"cast_timer"] <= 0 && 
//				action_barrage[?"cast_timer"] <= 0 &&
//				action_shoot[?"cast_timer"] <= 0 &&
//				action_shoot[?"channel_timer"] <= 0 &&
//				ai_toss_internal_cooldown_timer <= 0
//			){
//				if (distance < 640){
//					var did_toss = ladysofia_action_shoot_ranged_trigger(ai_target);
//					if (did_toss){
//						ai_toss_internal_cooldown_timer = ai_toss_internal_cooldown_value
//					}
//				}
//			}
//		};
	
//		ai_target_attack_should_channel = (action_chase[?"channel_timer"] > 0);
//	};

	
//	if (!ai_target_attack_should_channel){
//		if (my_dodge_timer <= my_dodge_value){
//			if (ai_target != noone && entity_enabled(ai_target)){
//				entity_move_point([ai_target.x, ai_target.y]);
//			} else {
//				entity_move_point(ai_target_move_point);
//			}
//		}
//	}
//}

//if (ai_toss_internal_cooldown_timer > 0){
//	ai_toss_internal_cooldown_timer -= TIMESPEED;
//}