var p_loop = argument0;
var p_size = argument1;
var p_speed = argument2;
while(p_loop > 0){
	var p_count = 3;
	var p_model = game_particle_setup_basic(my_shoot_flair_color, (p_size + random(p_size)), (p_speed + random(p_speed)), ((0.5*SEC) + random(0.25*SEC)), pt_shape_line);
	hero_particles_create(40, p_model, p_count);
	p_loop --;
}