var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var deducted_flinch = base_target.status_poise_current - base_value;
if (deducted_flinch  <= 0 && base_target.status_health_current > 0){	
	hero_action_beatdown(args);
	
	var over_flinch = abs(deducted_flinch);

	if (over_flinch> 0){
		var over_damage = (over_flinch/base_target.status_poise_max)*status_damage_total*0.75;
		entity_damage_deal([base_target, over_damage, false, "main_attack"])
	}
}

return [base_target, base_value];