var p_spawn = 90;
var p_count = 3;
var p_model = game_particle_setup_basic(my_chase_color, (0.5 + random(1.5)), 0.5, 0.75*SEC);

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);

var chase_angle = point_direction(x,y,action_chase_target.x,action_chase_target.y);
var compute_flip = (chase_angle <= 90 && chase_angle >= 0) || (chase_angle <= 360 && chase_angle >= 270)
var action_angle = compute_flip ? chase_angle : chase_angle - 180;
var action_direction = compute_flip ? 1 : -1;
animation_angle = action_angle;
animation_direction = action_direction;

if (my_chase_dash_timer <= 0){
	
	var rad_angle = degtorad(angle_between(action_chase_target.x,action_chase_target.y,x,y) + random_mirror(90));
	if (distance_between(x,y,action_chase_target.x,action_chase_target.y) < action_dash[?"range"]*1.5){
		rad_angle = degtorad(angle_between(action_chase_target.x,action_chase_target.y,x,y));
	}
	
	var angle_x = x + (cos(rad_angle)*10);
	var angle_y = y + (sin(rad_angle)*10);
	action_dash_trigger([angle_x, angle_y]);
	
	my_chase_dash_timer = my_chase_dash_value;
} else {
	my_chase_dash_timer -= TIMESPEED
}