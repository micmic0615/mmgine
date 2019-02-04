var condition = argument0;
var ally_or_enemy = argument1;
var distance_check = argument2;

var me = id;
var valid_target_actor = noone;
var valid_target_distance = distance_check;
var enemy = ally_or_enemy == "ally" ? false : true;
var within_distance = condition == "far" ? false : true;
var running_validation_variable = undefined;



with(ACTOR){
	if (entity_enabled() && id != me){
		if (
			(enemy && player_faction != me.player_faction) ||
			(!enemy && player_faction == me.player_faction)
		){
			var distance = distance_between(x,y,me.x,me.y);
			if (
				(within_distance && distance < valid_target_distance) ||
				(!within_distance && distance > valid_target_distance) 
			){
				switch(condition){
					case "near":
						if (
							running_validation_variable == undefined ||
							distance < running_validation_variable
						){
							valid_target_actor = id;
							running_validation_variable = distance
						}
						break
	
					case "far":
						if (
							running_validation_variable == undefined ||
							distance > running_validation_variable
						){
							valid_target_actor = id;
							running_validation_variable = distance
						}
						break
		
					case "health_low":
						if (
							running_validation_variable == undefined ||
							(status_health_current/status_health_max) < running_validation_variable
						){
							valid_target_actor = id;
							running_validation_variable = (status_health_current/status_health_max) 
						}
						break
						
					case "health_high":
						if (
							running_validation_variable == undefined ||
							(status_health_current/status_health_max)  > running_validation_variable
						){
							valid_target_actor = id;
							running_validation_variable = (status_health_current/status_health_max) 
						}
						break
						
					case "health_low_not_full":
						if (
							(running_validation_variable == undefined ||
							(status_health_current/status_health_max) < running_validation_variable) &&
							status_health_current < status_health_max
						){
							valid_target_actor = id;
							running_validation_variable = (status_health_current/status_health_max) 
						}
						break
	
					
				}
			}
		}
	}
}

return valid_target_actor;