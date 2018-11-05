var move_angle = argument0;
if (entity_class_lower == "actor"){actor_record_replay_data("move_angle", move_angle)};

var angle = entity_run_class_scripts("move_angle", move_angle);
ds_list_add(status_move_angle_list, angle);