action_generic_step(action_invoke, "invoke");

if (action_invoke[?"sequence"] <= 0){
	action_invoke[?"create_lock"] = 0
}