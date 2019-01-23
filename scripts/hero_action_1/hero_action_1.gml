var target_point = argument0;
if (action_shoot_backswing_timer == 0 || action_shoot_backswing_timer > action_shoot_backswing_value*0.7){
	action_shoot_trigger(target_point);
} else {
	action_shoot_trigger_cancel(target_point);
}
