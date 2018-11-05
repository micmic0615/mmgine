var near_or_far = argument0;
var ally_or_enemy = argument1;
var distance_check = argument2;

var me = id;
var valid_target_actor = noone;
var valid_target_distance = INFINITY;
var near = near_or_far == "far" ? false : true;
var enemy = ally_or_enemy == "ally" ? false : true;

with(ACTOR){
	if (ACTIVE && ALIVE){
		if (
			(enemy && player_faction != me.player_faction) ||
			(!enemy && player_faction == me.player_faction)
		){
			var distance = distance_between(x,y,me.x,me.y);
			if (
				(near && distance < distance_check && distance < valid_target_distance) ||
				(!near && distance > distance_check && distance > valid_target_distance) 
			){
				valid_target_actor = id;
				valid_target_distance = distance;
			}
		}
	}
}

return valid_target_actor;