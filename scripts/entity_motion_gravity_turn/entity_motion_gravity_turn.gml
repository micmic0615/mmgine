var move_total_x = argument[0];
var move_total_y =  argument[1];

var gravity_x = argument[2];
var gravity_y = argument[3];

var movement_x = argument[4];
var movement_y = argument[5];

if (abs(physics_motion_spill_x) > 1){ physics_motion_spill_x -= sign(physics_motion_spill_x); movement_x += sign(physics_motion_spill_x)};
if (physics_motion_spill_y > 1){ physics_motion_spill_y -= 1; movement_y += 1; };
if (abs(move_total_x) > 50*PPS || abs(move_total_y) > 50*PPS){
	animation_name = "walk";
			
	if (animation_rotatable){
		animation_angle = point_direction(x,y,x+move_total_x,y+move_total_y);
	} else {
		animation_angle = 0
	}
			
	if (physics_gravity_on == true){
		if (physics_gravity_angle > 45 && physics_gravity_angle <= 135){
			animation_direction = move_total_x != 0 ? sign(move_total_x) : animation_direction;
		} else if (physics_gravity_angle > 135 && physics_gravity_angle <= 225){
			animation_direction = move_total_y != 0 ? sign(move_total_y) : animation_direction;
		} else if (physics_gravity_angle > 225 && physics_gravity_angle <= 315){
			animation_direction = move_total_x != 0 ? sign(move_total_x)*-1 : animation_direction;
		} else if ((physics_gravity_angle > 315 || physics_gravity_angle <= 45) ){
			animation_direction = move_total_y != 0 ? sign(move_total_y)*-1 : animation_direction;
		}
	} else {
		animation_direction = move_total_x != 0 ? sign(move_total_x) : animation_direction;
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