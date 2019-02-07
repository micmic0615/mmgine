var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

if (base_source != id){
	if (damage_id == "main_attack"){
		action_shoot[?"cast_timer"] = min(action_shoot[?"cast_timer"], 0.5*SEC);
		
		if (my_frenzy_timer > 0){
			my_frenzy_timer = 0;
			action_shoot[?"cooldown_timer"] = my_shoot_cooldown_value;
		}
	}
}