var p = argument0;

var value_push_distance = p[1];
var value_push_duration = p[2];
var value_push_angle = p[3];
var rad_angle = degtorad(value_push_angle);

for(var i = 0; i < ds_list_size(collision_entities);i++){
	var p = ds_list_find_value(collision_entities, i);
	
	var x_move = cos(rad_angle)*value_push_distance/value_push_duration;
	var y_move = sin(rad_angle)*value_push_distance/value_push_duration;
	
	with(p){
		entity_add_motion(x_move, y_move, value_push_duration)
	}
}