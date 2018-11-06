var args = argument[0];
var valid = argument_count >= 2 ? argument[1] : false;
var me = id;

var base_target = args[0];
var base_value = args[1];

if (global.replay_mode == "play"){
	var base_actor_id = base_target;
	with(ACTOR){if (base_actor_id == actor_id){base_target = id}};
} else if (global.replay_mode == "record") {
	valid = true;
	actor_record_replay_data("flinch_deal", [base_target.actor_id, base_value])
}

if (valid){
	var adjusted_args = entity_run_type_scripts("flinch_deal", [base_target, base_value]);
	var adjusted_target = is_array(adjusted_args) ? adjusted_args[0] : base_target;
	var adjusted_value = is_array(adjusted_args) ? adjusted_args[1] : base_value;
	
	with(adjusted_target){
		if (actor_buff_find("flinched") == undefined){
			status_poise_current -= adjusted_value;
			if (status_poise_current <= 0){
				actor_buff_apply("flinched", status_flinch_duration, [], "flinched");		
				status_poise_current = status_poise_max;
			}
		}
	}
}


