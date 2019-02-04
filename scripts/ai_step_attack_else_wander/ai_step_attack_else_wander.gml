var target_type = argument_count >= 1 ? argument[0] : ["near", "enemy"];

ai_target_move_cooldown_timer -= TIMESPEED;
ai_target_distance_limit = enemy_attack_range_total*1.25;
ai_target_attack_aquisition_range = enemy_attack_range_total;

var should_attack = false;

if (!entity_enabled(ai_target)){
	ai_target_attack_should_channel = false;
	ai_target = noone;
} 
	
if (ai_target_move_cooldown_timer <= 0){
	ai_target_move_cooldown_timer = round(random(ai_target_move_cooldown_value));
	ai_target_move_point = ai_target == noone ? [round(random(room_width)), round(random(room_height))] : [ai_target.x, ai_target.y];
}

if (ai_target == noone){
	ai_target = ai_get_target(target_type[0], target_type[1], ai_target_distance_limit);
	if (ai_target != noone){
		ai_target_move_point = [ai_target.x,ai_target.y]
	}
} else {
	if (ai_target_attack_should_channel == false){
		var target_distance = distance_between(x,y,ai_target.x,ai_target.y);
		if (target_distance < ai_target_distance_limit){
			if (target_distance < ai_target_attack_aquisition_range){
				should_attack = true
			}
		} else {
			ai_target = noone;
		}
	} else {
		should_attack = true;
	}
}

return should_attack;

