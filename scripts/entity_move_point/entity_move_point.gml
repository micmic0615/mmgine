var point = entity_run_class_scripts("move_point", [argument0, argument1]); 
var angle = radtodeg(arctan2((point[1] - y), (point[0] - x)));
ds_list_add(status_move_angle_list, angle);