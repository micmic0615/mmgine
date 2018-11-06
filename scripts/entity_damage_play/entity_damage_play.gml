if (ACTIVE && ALIVE && global.replay_mode == "play"){
	var args = argument0;
	var me = id;

	var base_target = noone;
	var base_actor_id = args[0];
	var base_value = args[1];
	var base_lethal = args[2];
	
	with(ACTOR){if (base_actor_id == actor_id){base_target = id}}

	var adjusted_args = entity_run_class_scripts("damage_deal", [base_target, base_value, base_lethal]);

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






