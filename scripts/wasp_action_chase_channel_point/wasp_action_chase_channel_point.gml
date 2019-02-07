entity_sfx_create_pulse(
	/*sprite*/ ExplosionBulletAlt_idle,
	/*duration*/ my_shoot_cast_value,
	/*blend*/ my_chase_color,
	/*style_data*/ [
		220,
		40,
		2
	]
);

action_shoot_trigger([action_chase[?"target_entity"].x,action_chase[?"target_entity"].y]);

var cast_value = 1 - (action_shoot_cast_timer / action_shoot_cast_value);
var p_spawn = 60;
var p_count = 5;
var p_model = game_particle_setup_basic(my_chase_color, (1 + random(2)*cast_value), 1 + 1.5*cast_value, 0.5*SEC);

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_spark,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);