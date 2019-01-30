var move_total_x = 0;
var move_total_y = 0;

entity_age += TIMESPEED;
var next_entity_age = entity_age + TIMESPEED;

physics_motion_x = 0;
physics_motion_y = 0;
		
var gravity_x = 0;
var gravity_y = 0;

if (floor(entity_age) != floor(next_entity_age) && physics_gravity_on){
	physics_gravity_falling = physics_gravity_current == 0 ? 0 : physics_gravity_falling;
	physics_gravity_falling += physics_gravity_current;
	physics_gravity_current = min(physics_gravity_current + physics_gravity_force, physics_gravity_max);
		
	var rad_angle = degtorad(physics_gravity_angle);
		
	gravity_x = cos(rad_angle)*physics_gravity_current*physics_gravity_factor;
	gravity_y = sin(rad_angle)*physics_gravity_current*physics_gravity_factor;
		
	//var gravity_slide = 0.5*SEC;
	//entity_motion_add(gravity_x/gravity_slide, gravity_y/gravity_slide, gravity_slide, ["none"], "gravity");
}

physics_motion_x += gravity_x;
physics_motion_y += gravity_y;

return [move_total_x, move_total_y, gravity_x, gravity_y]