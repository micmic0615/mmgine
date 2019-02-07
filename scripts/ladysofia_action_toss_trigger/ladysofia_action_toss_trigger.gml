var target = argument0;
if (my_shoot_switch == "toss" || my_shoot_switch == "free"){
	ladysofia_mod_shoot_toss();
	action_shoot_trigger(target);
	var did_shoot = action_shoot_trigger(target);
	if (did_shoot){my_shoot_switch = "toss"};
}

return (my_shoot_switch == "toss")
