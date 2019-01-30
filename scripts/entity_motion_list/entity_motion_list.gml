var move_total_x = argument[0];
var move_total_y =  argument[1];

var angle_find_x = x;
var angle_find_y = y;

for(var i = 0; i < ds_list_size(physics_motion_list);i++){
	var p = ds_list_find_value(physics_motion_list, i);
	
	var motion_x = p[0];
	var motion_y = p[1];
	var motion_lifespan = p[2];
	var motion_decay = p[3];
	var motion_id = p[4];
			
	var next_lifespan = motion_lifespan - TIMESPEED;
	
	if (abs(motion_x) < 0.01){motion_x = 0}
	if (abs(motion_y) < 0.01){motion_y = 0}
	
	physics_motion_x += motion_x;
	physics_motion_y += motion_y;
			
	if (motion_id == "move_motion"){
		move_total_x += motion_x;
		move_total_y += motion_y;
		angle_find_x += motion_x;
		angle_find_y += motion_y;
	}
			
	if (round(motion_lifespan) > round(next_lifespan)){
		switch(motion_decay[0]){
			case "linear":
				motion_x = (motion_x/motion_lifespan)*(motion_lifespan - 1);
				motion_y = (motion_y/motion_lifespan)*(motion_lifespan - 1);
				break
						
			case "multiply":
				motion_x /= motion_decay[1];
				motion_y /= motion_decay[1];
				break
					
			case "none":
			default:
				break;
		}
	}
	
	if (motion_x == 0 && motion_y == 0){motion_lifespan = 0}
	if (motion_lifespan < INFINITY){	
		if (motion_lifespan > 0){
			ds_list_replace(physics_motion_list, i, [
				motion_x,
				motion_y,
				next_lifespan,
				motion_decay,
				motion_id
			])
		} else {
			ds_list_delete(physics_motion_list, i);
			i--;
		}
	} 
}

physics_motion_angle = angle_between(angle_find_x, angle_find_y, x, y);
		
var time_x = physics_motion_x*TIMESPEED;
var time_y = physics_motion_y*TIMESPEED

var movement_x = floor(time_x);
var movement_y = floor(time_y);



physics_motion_spill_x += (time_x - movement_x);
physics_motion_spill_y += (time_y - movement_y);

return [move_total_x, move_total_y, movement_x, movement_y]