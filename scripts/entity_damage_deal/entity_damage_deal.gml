if (ACTIVE && ALIVE){
	var args = argument[0];
	var valid = argument_count >= 2 ? argument[1] : false;
	var me = id;	
	
	var base_target = args[0];
	var base_value = args[1];
	var base_lethal = args[2];
	
	if (global.replay_mode == "play"){
		var base_actor_id = base_target;
		with(ACTOR){if (base_actor_id == actor_id){base_target = id}};
	} else if (global.replay_mode == "record") {
		valid = true;
		
		if (base_target.entity_class_lower == "actor"){
			actor_record_replay_data("damage_deal", [base_target.actor_id, base_value, base_lethal])
		}
	}
	
	if (base_target != noone && base_target.entity_class_lower != "actor"){valid = true}
	
	if (valid){
		var adjusted_args = entity_run_class_scripts("damage_deal", [base_target, base_value, base_lethal]);

		var adjusted_target = is_array(adjusted_args) ? adjusted_args[0] : base_target;
		var adjusted_value = is_array(adjusted_args) ? adjusted_args[1] : base_value;
		var adjusted_lethal = is_array(adjusted_args) ? adjusted_args[1] : base_lethal;
		
		var final_args = adjusted_args;
		with(adjusted_target){final_args = entity_damage_take([adjusted_target, adjusted_value, adjusted_lethal])};
		
		var final_target = is_array(final_args) ? final_args[0] : adjusted_target;
		var final_value = is_array(final_args) ? final_args[1] : round(adjusted_value);
		var final_lethal = is_array(final_args) ? final_args[1] : adjusted_lethal;
		
	
		if (final_value > 0){
			with(final_target){
				if (ACTIVE && ALIVE && !status_immortal){
					var offset_angle = degtorad(angle_between(final_target.x, final_target.y, me.x, me.y) + random(60) - 30);
					if (final_target.entity_class_lower == "actor"){
						entity_draw_text_following(final_value, [cos(offset_angle)*40, sin(offset_angle)*40], 1.5*SEC, c_white, 32);
					}
					
					var min_health = final_lethal ? 0 : 1;
					status_health_current = max(min_health, status_health_current - final_value);
					if (status_health_current <= 0){entity_killer = me};
					
				}
			}
		}
	}
}






