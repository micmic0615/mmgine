var target_point = argument0;

if (my_shoot_aim_mode == true){
	my_shoot_aim_mode = false;
	my_shoot_aim_dash_disable_timer = my_shoot_aim_dash_disable_value;
}

action_dash_trigger(target_point);
