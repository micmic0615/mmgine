var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

if (base_source != id){
	if (damage_id == "main_attack"){
		action_shoot_cast_timer = 1;
		
		if (my_frenzy_timer > 0){
			my_frenzy_timer = 0;
			action_shoot_cooldown_timer = my_shoot_cooldown_value;
		}
	}
}