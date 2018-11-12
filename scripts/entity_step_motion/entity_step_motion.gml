var move_x_total = 0;
var move_y_total = 0;


		
entity_age += TIMESPEED;
physics_motion_x = 0;
physics_motion_y = 0;
		
var next_entity_age = entity_age + TIMESPEED;
		
var gravity_x = 0;
var gravity_y = 0;
if (floor(entity_age) != floor(next_entity_age)){
	if (physics_gravity_on){
		physics_gravity_falling = physics_gravity_current == 0 ? 0 : physics_gravity_falling;
		physics_gravity_falling += physics_gravity_current;
		physics_gravity_current = min(physics_gravity_current + physics_gravity_force, physics_gravity_max);
		gravity_x = cos(degtorad(physics_gravity_angle))*physics_gravity_current*physics_gravity_factor;
		gravity_y = sin(degtorad(physics_gravity_angle))*physics_gravity_current*physics_gravity_factor;
		
		var gravity_slide = 0.5*SEC;
		entity_motion_add(gravity_x/gravity_slide, gravity_y/gravity_slide, gravity_slide, ["none"], "gravity");
	}
}
		
var list_length = ds_list_size(status_move_angle_list);
		
for(var i = 0; i < list_length;i++){
	var angle = ds_list_find_value(status_move_angle_list, i);
	var rad_angle = degtorad(angle)
	var speed_factor = (status_movespeed_total/(list_length*status_movesnap_total));
	
	
	var move_x = cos(rad_angle)*speed_factor;
	var move_y = sin(rad_angle)*speed_factor;
			
	if (entity_class_lower != "bullet"){
		if (floor(entity_age) != floor(next_entity_age)){
			entity_motion_add(move_x, move_y, status_movesnap_total, ["linear"], "move_motion");
		}
	} else {
		var movesnap_x = move_x*status_movesnap_total*TIMESPEED;
		var movesnap_y = move_y*status_movesnap_total*TIMESPEED;
		physics_motion_x += movesnap_x;
		physics_motion_y += movesnap_y;
		move_x_total += movesnap_x;
		move_y_total += movesnap_y;
	}
}
			
ds_list_clear(status_move_angle_list);
status_movesnap_total = max(2, status_movesnap_base);
status_movespeed_total = status_movespeed_base;

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
	
	physics_motion_x += motion_x;
	physics_motion_y += motion_y;
			
	if (motion_id == "move_motion"){
		move_x_total += motion_x;
		move_y_total += motion_y;
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
		
if (abs(physics_motion_spill_x) > 1){ physics_motion_spill_x -= sign(physics_motion_spill_x); movement_x += sign(physics_motion_spill_x)};
if (physics_motion_spill_y > 1){ physics_motion_spill_y -= 1; movement_y += 1; };
if (abs(move_x_total) > 50*PPS || abs(move_y_total) > 50*PPS){
	animation_name = "walk";
			
	if (animation_rotatable){
		animation_angle = point_direction(x,y,x+move_x_total,y+move_y_total);
	} else {
		animation_angle = 0
	}
			
	if (physics_gravity_on == true){
		if (physics_gravity_angle > 45 && physics_gravity_angle <= 135){
			animation_direction = move_x_total != 0 ? sign(move_x_total) : animation_direction;
		} else if (physics_gravity_angle > 135 && physics_gravity_angle <= 225){
			animation_direction = move_y_total != 0 ? sign(move_y_total) : animation_direction;
		} else if (physics_gravity_angle > 225 && physics_gravity_angle <= 315){
			animation_direction = move_x_total != 0 ? sign(move_x_total)*-1 : animation_direction;
		} else if ((physics_gravity_angle > 315 || physics_gravity_angle <= 45) ){
			animation_direction = move_y_total != 0 ? sign(move_y_total)*-1 : animation_direction;
		}
	} else {
		animation_direction = move_x_total != 0 ? sign(move_x_total) : animation_direction;
	}
			
	if (animation_direction == -1 && animation_rotatable){animation_angle -= 180}
} else {
			
	if (physics_gravity_on){
		var target_gravity = angle_clean(point_direction(x,y,x+gravity_x,y+gravity_y) + 90);	
		if (
			(physics_gravity_angle > 45 && physics_gravity_angle <= 135 && collision_contact_y == "bottom") ||
			(physics_gravity_angle > 135 && physics_gravity_angle <= 225 && collision_contact_x == "left") ||
			(physics_gravity_angle > 225 && physics_gravity_angle <= 315 && collision_contact_y == "top") ||
			((physics_gravity_angle > 315 || physics_gravity_angle <= 45) && collision_contact_x == "right")
		) {
			physics_gravity_current = 0;
			animation_name = "idle";
			animation_angle = target_gravity;
		} else {
			animation_name = physics_gravity_falling >= 1 ? ((physics_gravity_current > physics_gravity_max*0.25) ? "fall" : "rise") : "idle";
			animation_angle = angle_shift(animation_angle, target_gravity, physics_gravity_turnrate)
		}
	} else {
		animation_name = "idle";
	}
}

return [movement_x, movement_y]