var p_spawn = 90;
var p_count = 3;
var p_model = game_particle_setup_basic(my_chase_color_particles, (0.5 + random(1.5)), 0.5, 0.75*SEC);

part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),pt_shape_star,1);
part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);

var chase_angle = point_direction(x,y,action_chase[?"target_entity"].x,action_chase[?"target_entity"].y);
var compute_flip = (chase_angle <= 90 && chase_angle >= 0) || (chase_angle <= 360 && chase_angle >= 270)
var action_angle = compute_flip ? chase_angle : chase_angle - 180;
var action_direction = compute_flip ? 1 : -1;
animation_angle = action_angle;
animation_direction = action_direction;


var fire_angle = angle_between(action_chase[?"target_entity"].x,action_chase[?"target_entity"].y,x,y);
var sword_angle = [action_chase[?"target_entity"].x + (cos(degtorad(fire_angle))*9999), action_chase[?"target_entity"].y + (sin(degtorad(fire_angle))*9999)]
if (my_chase_jump_cooldown_timer > 0 && my_chase_jump_cast_timer <= 0){
	my_chase_jump_cooldown_timer -= TIMESPEED;
}

if (
	my_chase_jump_cooldown_timer <= 0 && 
	!my_chase_jump_active && 
	my_chase_jump_count > 0 && 
	distance_between(x,y,action_chase[?"target_entity"].x, action_chase[?"target_entity"].y) < my_chase_jump_min_distance
){
	my_chase_jump_active = true;
	my_chase_jump_cast_timer = my_chase_jump_cast_value;
	my_chase_jump_cooldown_timer = my_chase_jump_cooldown_value;
	my_chase_jump_point = sword_angle
	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ my_chase_jump_cast_value,
		/*blend*/ my_chase_color_particles,
		/*style_data*/ [
			180,
			40,
			2
		]
	);
}

if (my_chase_jump_active){
	actor_buff_apply("armor_health", 1, [-50], "wasp_chase_penalty_health");
	actor_buff_apply("armor_poise", 1, [-500], "wasp_chase_penalty_poise");
	action_chase[?"channel_timer"] += TIMESPEED;
	sword_angle = my_chase_jump_point;
	fire_angle = angle_between(my_chase_jump_point[0],my_chase_jump_point[1],x,y);	
	if (my_chase_jump_cast_timer > 0){
		my_chase_jump_cast_timer -= TIMESPEED;
		actor_buff_apply("rooted", 2, [], "chase_jump");
	} else {
		var jump_time = my_chase_jump_range/my_chase_jump_speed;
		my_chase_jump_mirage_timer = jump_time;
		entity_motion_push(my_chase_jump_range, jump_time, fire_angle)
		my_chase_jump_count--;
		my_chase_jump_active = false;
		my_chase_jump_mirage_down = true
	}
}

if (my_chase_jump_mirage_timer > 0 ){
	action_chase[?"channel_timer"] += TIMESPEED;
	sword_angle = my_chase_jump_point;
	fire_angle = angle_between(my_chase_jump_point[0],my_chase_jump_point[1],x,y);
	if (entity_room_age_modulo(0.075*SEC)){					
		entity_mirage_create(0.5*SEC, 0, 0, make_color_rgb(200,200,200), 0.75);
	}
	my_chase_jump_mirage_timer -= TIMESPEED;
} else {
	if (my_chase_jump_mirage_down){
		my_chase_sword_disable_timer = 0.5*SEC;
		my_chase_jump_mirage_down = false;
	}
}

if (my_chase_sword_disable_timer > 0){
	actor_buff_apply("rooted", 2, [], "chase_jump");
	my_chase_sword_disable_timer -= TIMESPEED
}
	

var spawn_interval = 0.2*SEC;

if (entity_room_age_modulo(spawn_interval) && my_chase_jump_cast_timer <= 0 && my_chase_sword_disable_timer <= 0){
	var bullet_x = cos(degtorad(fire_angle))*my_chase_sword_radius + x;
	var bullet_y = sin(degtorad(fire_angle))*my_chase_sword_radius + y;

	var sword = actor_spawn_bullet(sword_angle[0], sword_angle[1], bullet_x,bullet_y, my_chase_sword_type[0]);
	var one_second = SEC;
	if (my_chase_jump_mirage_timer > 0){one_second = spawn_interval}
	ds_list_add(sword.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*(spawn_interval/one_second), true, my_chase_jump_mirage_timer > 0 ? "main_attack" : "side_attack"]);
	ds_list_add(sword.bullet_collision_entity_actions, ["flinch", "actor", status_flinch_total*(spawn_interval/one_second)]);
	ds_list_add(sword.bullet_collision_entity_actions, ["push", "actor", my_chase_jump_mirage_timer > 0 ? 240 : 100, 0.5*SEC, "movement", ["multiply",1.5]]);
	
	var sword_range = my_chase_jump_mirage_timer > 0 ? my_chase_sword_range*2 : my_chase_sword_range;
	var sword_speed = my_chase_sword_speed + my_chase_movespeed_set;
	if (my_chase_jump_mirage_timer > 0){sword_speed += my_chase_jump_speed}
	var sword_radius = my_chase_jump_mirage_timer > 0 ? my_chase_sword_radius*3 : my_chase_sword_radius;
	
	sword.animation_sprite = my_chase_sword_type[1];
	sword.status_movespeed_base = sword_speed;
	sword.collision_enabled_bullets = false;
	sword.bullet_lifespan = sword_range/sword_speed;
	sword.status_movesnap_base = 0.1*SEC;
	sword.bullet_action_move_angle = fire_angle;
	sword.collision_impact_health_max = INFINITY;
	sword.physics_gravity_on = false;
	sword.image_xscale = (sword_radius*2)/sprite_get_width(sprite_index);
	sword.image_yscale = (sword_radius*2)/sprite_get_height(sprite_index);
	sword.bullet_seek_range = 0;
	sword.bullet_death_spawn[?"type"] = noone;
	
	if (my_chase_jump_mirage_timer > 0){
		ds_list_add(
			sword.draw_particle_list, 
			[game_particle_setup_basic(my_chase_color_particles, 3 + random(5), 0.5, 0.25*SEC), 18, sword_radius]
		);
				
		ds_list_add(
			sword.draw_particle_list, 
			[game_particle_setup_basic(my_chase_color, 3 + random(5), 0.25, 0.15*SEC), 18, sword_radius]
		);
	} else {
		ds_list_add(
			sword.draw_particle_list, 
			[game_particle_setup_basic(my_chase_color_particles, 1.5 + random(2), 0.5, 0.25*SEC), 6, sword_radius]
		);
				
		ds_list_add(
			sword.draw_particle_list, 
			[game_particle_setup_basic(my_chase_color, 1 + random(2), 0.25, 0.15*SEC), 6, sword_radius]
		);
	}
}
