var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];

if (base_target.entity_class_lower == "actor" && base_lethal == false){
	var retarget_x = undefined;
	var retarget_y = undefined;
	with(base_target){
		if (actor_buff_find("flinched") != undefined){
			retarget_x = x;
			retarget_y = y;
		}
	}
	
	if (retarget_x != undefined && retarget_y != undefined){
		my_attack_cooldown_timer = 0;
		seeker_action_attack_2([retarget_x, retarget_y])
	}
}

return [base_target, base_value, base_lethal];