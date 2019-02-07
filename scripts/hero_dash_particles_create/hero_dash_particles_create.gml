var p_loop = argument[0];
var p_size = argument[1];
var p_speed = argument[2];
var p_color = argument_count >= 4 ? argument[3] : my_shoot_color;

while(p_loop > 0){
	var p_count = 3;
	var p_model = game_particle_setup_basic(p_color, (p_size + random(p_size)), (p_speed + random(p_speed)), ((0.5*SEC) + random(0.25*SEC)), pt_shape_line);
	hero_particles_create(40, p_model, p_count);
	p_loop --;
}