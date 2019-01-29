var move_total_x = 0;
var move_total_y = 0;

entity_age += TIMESPEED;
var next_entity_age = entity_age + TIMESPEED;

physics_motion_x = 0;
physics_motion_y = 0;
		
var gravity_x = 0;
var gravity_y = 0;

if (floor(entity_age) != floor(next_entity_age)){
	if (physics_gravity_on){
		physics_gravity_falling = physics_gravity_current == 0 ? 0 : physics_gravity_falling;
		physics_gravity_falling += physics_gravity_current;
		
		if (physics_gravity_current == 0){
			physics_gravity_x = 0;
			physics_gravity_y = 0;
		}
		
		physics_gravity_current = min(physics_gravity_current + physics_gravity_force, physics_gravity_max);
		
		var rad_angle = degtorad(physics_gravity_angle);
		
		gravity_x = cos(rad_angle)*physics_gravity_current*physics_gravity_factor;
		gravity_y = sin(rad_angle)*physics_gravity_current*physics_gravity_factor;
		
		var gravity_slide = 0.5*SEC;
		//entity_motion_add(gravity_x/gravity_slide, gravity_y/gravity_slide, gravity_slide, ["none"], "gravity");
		
		if (physics_gravity_x < gravity_x){
			physics_gravity_x += (gravity_x/gravity_slide)
		}
		
		if (physics_gravity_y < gravity_y){
			physics_gravity_y += (gravity_y/gravity_slide)
		}
	} else {
		physics_gravity_x = 0;
		physics_gravity_y = 0;
	}
}

physics_motion_x += physics_gravity_x;
physics_motion_y += physics_gravity_y;

var list_length = ds_list_size(status_move_angle_list);
if (entity_class_lower == "actor"){	
	if (list_length > 0){
		for(var i = 0; i < list_length;i++){
			var angle = ds_list_find_value(status_move_angle_list, i);
			var rad_angle = degtorad(angle)
		
			var speed_slide = list_length*status_movesnap_total;
	
			var move_x = cos(rad_angle)*status_movespeed_total*TIMESPEED;
			var move_y = sin(rad_angle)*status_movespeed_total*TIMESPEED;
	
			var movesnap_x = move_x / speed_slide;
			var movesnap_y = move_y / speed_slide;
		
			physics_movement_x += movesnap_x;
			physics_movement_y += movesnap_y;
		}
	
		if (abs(physics_movement_x) + abs(physics_movement_y) > status_movespeed_total) {
			var ratio = (abs(physics_movement_x) + abs(physics_movement_y)) / status_movespeed_total;
			physics_movement_x /= ratio;
			physics_movement_y /= ratio;
		}
	
		physics_movement_angle = angle_between(physics_movement_x, physics_movement_y, 0 , 0)
	} else {
		var move_slide = (status_movespeed_total*TIMESPEED)/(status_movesnap_total);
	
		var rad_angle = degtorad(physics_movement_angle);
		var move_slide_x = cos(rad_angle)*move_slide;
		var move_slide_y = sin(rad_angle)*move_slide;
	
		if (abs(physics_movement_x) > abs(move_slide_x)){
			physics_movement_x -= move_slide_x
		} else {
			physics_movement_x = 0
		}
	
		if (abs(physics_movement_y) > abs(move_slide_y)){
			physics_movement_y -= move_slide_y
		} else {
			physics_movement_y = 0
		}
	}
	
	physics_motion_x += physics_movement_x;
	physics_motion_y += physics_movement_y;
	move_total_x += physics_movement_x;
	move_total_y += physics_movement_y;
} else {
	for(var i = 0; i < list_length;i++){
		var angle = ds_list_find_value(status_move_angle_list, i);
		var rad_angle = degtorad(angle)
		
		var speed_factor = (status_movespeed_total/(list_length*status_movesnap_total));
	
		var move_x = cos(rad_angle)*speed_factor;
		var move_y = sin(rad_angle)*speed_factor;
	
		var movesnap_x = move_x*status_movesnap_total*TIMESPEED;
		var movesnap_y = move_y*status_movesnap_total*TIMESPEED;
		physics_motion_x += movesnap_x;
		physics_motion_y += movesnap_y;
		move_total_x += movesnap_x;
		move_total_y += movesnap_y;
	}
}



			
ds_list_clear(status_move_angle_list);
status_movesnap_total = max(2, status_movesnap_base);
status_movespeed_total = status_movespeed_base;

return [move_total_x, move_total_y, gravity_x, gravity_y]