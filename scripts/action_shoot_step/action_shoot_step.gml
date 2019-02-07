action_generic_step(action_shoot, "shoot");

if (action_shoot[?"combo_timer"] > 0){
	action_shoot[?"combo_timer"] -= TIMESPEED
} else {
	action_shoot[?"combo_count"] = 0
}