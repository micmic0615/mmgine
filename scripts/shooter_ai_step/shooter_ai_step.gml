ai_target_move_cooldown_timer -= TIMESPEED;
if (!instance_exists(ai_target)){
	ai_target_attack_should_channel = false;
	ai_target = noone;
} 
	
if (ai_target_move_cooldown_timer <= 0){
	ai_target_move_cooldown_timer = round(random(ai_target_move_cooldown_value));
	ai_target_move_point = ai_target == noone ? [round(random(room_width)), round(random(room_height))] : [ai_target.x, ai_target.y];
}

if (ai_target == noone){
	ai_target = ai_get_target("near", "enemy", ai_target_distance_limit);
	if (ai_target != noone){
		ai_target_move_point = [ai_target.x,ai_target.y]
	}
} else {
	if (ai_target_attack_should_channel == false){
		var target_distance = distance_between(x,y,ai_target.x,ai_target.y);
		if (target_distance < ai_target_distance_limit){
			if (target_distance < ai_target_attack_aquisition_range){
				ai_target_attack_should_channel = true;
			}
		} else {
			ai_target = noone;
		}
	} else {
		actor_action_channel([ai_target.x,ai_target.y]);
		
		if (my_attack_channel_power_current >= my_attack_channel_power_max){
			actor_action_attack_1([ai_target.x,ai_target.y])
			ai_target_attack_should_channel = false;
		}
	}
}

entity_move_point(ai_target_move_point);
