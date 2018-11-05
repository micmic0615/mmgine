if (ACTIVE && ALIVE){
	var move_point = [round(argument0[0]), round(argument0[1])];
	if (entity_class_lower == "actor"){actor_record_replay_data("move_point", move_point)};

	var point = entity_run_class_scripts("move_point", move_point); 
	var angle = radtodeg(arctan2((point[1] - y), (point[0] - x)));
	ds_list_add(status_move_angle_list, angle);
}