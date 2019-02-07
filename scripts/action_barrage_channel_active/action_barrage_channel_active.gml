var action_map = argument[0];
action_generic_target_entity_to_point(action_map);
action_barrage_animation_face(action_map);
entity_run_type_scripts("action_barrage_channel_active", action_map[?"target_point"]);

if (entity_room_age_modulo(action_map[?"bullet_interval"])){	
	var rad_active_angle = degtorad(action_map[?"active_angle"]);
	var bullet_x = (cos(rad_active_angle)*(action_map[?"bullet_radius"]*0.5)) + x;
	var bullet_y = (sin(rad_active_angle)*(action_map[?"bullet_radius"]*0.5)) + y;
	
	var target_point = [
		(cos(rad_active_angle)*INFINITY) + x,
		(sin(rad_active_angle)*INFINITY) + y,
	]	
	
	var bullet_type = action_map[?"bullet_type"];
	var bullet = actor_spawn_bullet(target_point[0], target_point[1], bullet_x, bullet_y, bullet_type[0]);	
	
	var damage_factor = action_map[?"damage"];
	var flinch_factor = action_map[?"flinch"];
	var push_value = action_map[?"push"];
	
	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*damage_factor[0], true, "main_attack"]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", status_flinch_total*flinch_factor[0]]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", push_value[0], 0.5*SEC, "origin", ["multiply",1.5]]);		
		
	bullet.animation_sprite = bullet_type[1];
	bullet.status_movespeed_base = action_map[?"bullet_speed"];
	bullet.bullet_lifespan = action_map[?"bullet_range"]/action_map[?"bullet_speed"];
	bullet.status_movesnap_base = 0.1*SEC;
	bullet.bullet_action_move_angle = action_map[?"active_angle"] + random_mirror(action_map[?"bullet_angle_chaos"]);
	bullet.collision_impact_health_max = action_map[?"bullet_impact_health"];
	bullet.collision_impact_health_current = action_map[?"bullet_impact_health"];
	bullet.bullet_collision_tile_action = "die";
	bullet.physics_gravity_on = false;
	bullet.image_xscale = (action_map[?"bullet_radius"]*2)/sprite_get_width(sprite_index);
	bullet.image_yscale = (action_map[?"bullet_radius"]*2)/sprite_get_height(sprite_index);
	bullet.bullet_seek_range = action_map[?"bullet_seek_range"];
	bullet.bullet_seek_turn_rate = action_map[?"bullet_seek_turn_rate"];
	bullet.bullet_seek_angle_limit = action_map[?"bullet_seek_angle_limit"];
	
	if (action_map[?"bullet_explosion_radius"] == 0){
		bullet.bullet_death_spawn[?"type"] = noone;
	} else {
		bullet.bullet_death_spawn[?"type"] = noone;
	}
	
	var round_radius = round(action_map[?"bullet_explosion_radius"]);
	
	if (round_radius > 0){
		bullet.bullet_death_spawn[?"explosion_radius_max"] = round_radius;
		bullet.bullet_death_spawn[?"explosion_lifespan_base"] = round_radius/(420*PPS);
		bullet.bullet_death_spawn[?"explosion_lifespan_current"] = round_radius/(420*PPS);;
		bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = action_map[?"color"];
		bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
		bullet.bullet_death_spawn[?"status_immortal"] = true;
	
		bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
			["damage", "actor", status_damage_total*damage_factor[1], true, "main_attack"],
			["flinch", "actor", status_flinch_total*flinch_factor[1]],
			["push", "actor", push_value[1], 0.5*SEC, "center", ["multiply",1.5]],
		]
	} else {
		bullet.bullet_death_spawn[?"type"] = noone
	}
	
	var bullet_particle_array = action_map[?"bullet_particles"];
	for(var i = 0; i < array_length_1d(bullet_particle_array);i++){
		var p = bullet_particle_array[i];
		ds_list_add(bullet.draw_particle_list, p);
	};
	
	entity_motion_push(action_map[?"recoil"], 0.5*SEC, action_map[?"active_angle"] - 180, ["multiply", 1.5])
}