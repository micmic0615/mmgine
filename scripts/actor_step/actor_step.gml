entity_run_type_scripts("step");

var list_length = ds_list_size(actor_move_angle_list);
for(var i = 0; i < list_length;i++){
	var angle = ds_list_find_value(actor_move_angle_list, i);
	var rad_angle = degtorad(angle)
	var speed_factor = (status_total_movespeed/list_length)/status_total_movesnap;
	var move_x = cos(rad_angle)*speed_factor;
	var move_y = sin(rad_angle)*speed_factor;
	entity_add_motion(move_x, move_y, status_total_movesnap);
}

ds_list_clear(actor_move_angle_list)
