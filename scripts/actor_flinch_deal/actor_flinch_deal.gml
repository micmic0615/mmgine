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
	
	var can_flinch = false;
	with(adjusted_target){if (actor_buff_find("flinched") == undefined){can_flinch = true}}
	
	if (can_flinch){
		adjusted_target.status_poise_current -= adjusted_value
		entity_run_type_scripts("flinch_deal", [adjusted_target, adjusted_value]);
		if (adjusted_target.status_poise_current <= 0){
			with(adjusted_target){actor_buff_apply("flinched", status_flinch_duration, [], "flinched")};	
			adjusted_target.status_poise_current = adjusted_target.status_poise_max;
		}
	}
}


