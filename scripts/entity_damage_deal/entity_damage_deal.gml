if (ACTIVE && ALIVE && 
	(entity_class_lower != "actor" || (entity_class_lower == "actor" && global.replay_mode == "record"))
){
	var args = argument0;
	var me = id;	
	
	
	
	var base_target = args[0];
	var base_value = args[1];
	var base_lethal = args[2];
	
	if (entity_class_lower == "actor" && base_target.entity_class_lower == "actor"){
		actor_record_replay_data("damage_deal", [base_target.actor_id, base_value, base_lethal])
	}

	var adjusted_args = entity_run_class_scripts("damage_deal", args);

	var adjusted_target = is_array(adjusted_args) ? adjusted_args[0] : base_target;
	var adjusted_value = is_array(adjusted_args) ? adjusted_args[1] : base_value;
	var adjusted_lethal = is_array(adjusted_args) ? adjusted_args[1] : base_lethal;
	
	if (adjusted_value > 0){
		with(adjusted_target){
			if (ACTIVE && ALIVE && !status_immortal){
				var min_health = adjusted_lethal ? 0 : 1;
				status_health_current = max(min_health, status_health_current - adjusted_value);
				if (status_health_current <= 0){entity_killer = me};
			}
		}
	}
}






