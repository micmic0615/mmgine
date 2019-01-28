var args = argument[0];
var base_target = args[0];
var base_value = args[1];


if (base_target.status_poise_current <= 0 && base_target.status_health_current > 0){	
	hero_action_beatdown(args);
}