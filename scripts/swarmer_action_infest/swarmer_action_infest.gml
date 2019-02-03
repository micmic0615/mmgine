var target = argument0;
if (entity_enabled(target)){
	var bug_count = action_clone_count + 1;
	var bug_angle = random(360);
	while(bug_count > 0){
		var bug = actor_spawn_bullet(target.x, target.y, 0,0, my_infest_bug_type[0]);
		var bug_scale = (my_infest_bullet_radius*2)/sprite_get_width(sprite_index);
		bug.animation_sprite = my_infest_bug_type[1];
		bug.collision_enabled_actors = false;
		bug.collision_enabled_bullets = false;
		bug.collision_enabled_doodads = false;
		bug.physics_gravity_on = false;	
		bug.status_movespeed_base = 0;
		bug.image_xscale = bug_scale;
		bug.image_yscale = bug_scale;
		bug.bullet_lifespan = INFINITY;
		bug.bullet_death_spawn[?"type"] = noone;
	
		ds_list_add(bug.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*my_infest_damage, true, "main_attack"]);
		ds_list_add(bug.bullet_collision_entity_actions, ["flinch", "actor", status_flinch_total*my_infest_flinch]);
	
		ds_list_add(
			bug.draw_particle_list, 
			[game_particle_setup_basic(my_infest_color_1, 1.5 + random(2), 0.5, 0.25*SEC), 6, my_infest_bullet_radius/2]
		);
				
		ds_list_add(
			bug.draw_particle_list, 
			[game_particle_setup_basic(my_infest_color_2, 1 + random(2), 0.25, 0.15*SEC), 6, my_infest_bullet_radius/2]
		);
	 
		ds_list_add(my_infest_bug_list, [target, bug, bug_angle, 80, bug_scale, 0]);
		bug_angle += 360/(action_clone_count + 1)
		bug_count--
	}
}
