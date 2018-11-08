var args = argument[0];
var flinch_source = args[0];
var flinch_value = args[1];
var me = id;

flinch_value = flinch_value/my_clone_count_total;
if (my_clone_original == true){
	if (status_poise_current <= 0){
		var odd_even = 0;
		with(object_index){
			if (my_clone_core == me && id != me){
				status_poise_current = 0;
				var you = id;
				with(flinch_source){if (odd_even % 3 == 0) {actor_flinch_deal([you, INFINITY])}; odd_even++}
				actor_buff_apply("armor_poise", status_flinch_duration*2, [50], "feedback_" + string(random(INFINITY)))
				actor_buff_apply("flinched", status_flinch_duration, [], "flinched");
			}
		}
	}
} else {
	if (instance_exists(my_clone_core)){
		if (my_clone_core.status_poise_current > 0){
			
			with(flinch_source){actor_flinch_deal([me.my_clone_core, flinch_value])}
			status_poise_current = my_clone_core.status_poise_current;
		}
	} else {
		status_poise_current = 1;
	}
}