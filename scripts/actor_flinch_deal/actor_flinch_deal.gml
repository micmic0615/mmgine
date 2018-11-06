var args = argument0;
var me = id;
var base_target = args[0];
var base_value = args[1];

var adjusted_args = entity_run_type_scripts("flinch_deal", args);
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

