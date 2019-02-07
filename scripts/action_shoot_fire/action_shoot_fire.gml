var bullet_angle = angle_between(action_shoot_target_point[0], action_shoot_target_point[1], x,y);
var bullet_max = action_shoot_bullet_count;
var bullet_spawn_offset = 0;

var bullet_count = bullet_max;
	
var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
	
var bullet_spread_angle = ((action_shoot_angle_spead*0.2) + ((bullet_max/13)*action_shoot_angle_spead))/bullet_max;

action_shoot_combo_count++;
action_shoot_combo_timer = action_shoot_cast_value + action_shoot_channel_value + action_shoot_backswing_value + 0.25*SEC;

while(bullet_count > 0){
	var bullet = actor_spawn_bullet(action_shoot_target_point[0], action_shoot_target_point[1], bullet_x,bullet_y, action_shoot_bullet_type[0]);
	var local_angle = bullet_angle;
	
	var angle_chaos = (random(action_shoot_angle_chaos) - (action_shoot_angle_chaos*0.5))
	local_angle += angle_chaos;
	
	bullet.status_movespeed_base = action_shoot_bullet_speed + random_mirror(action_shoot_speed_chaos);
	bullet.status_movesnap_base = 0.2*SEC;
	
	bullet.bullet_action_move_angle = local_angle + ((bullet_count-1)*bullet_spread_angle) - ((bullet_max-1)*(bullet_spread_angle/2));
		
	var rad_bullet_angle = degtorad(bullet.bullet_action_move_angle);
		
	bullet.animation_angle = point_direction(x,y,cos(rad_bullet_angle)*10 + x, sin(rad_bullet_angle)*10 + y)
	
	bullet.physics_gravity_on = false;
	
	bullet.image_xscale = (action_shoot_bullet_radius*2)/sprite_get_width(sprite_index);
	bullet.image_yscale = (action_shoot_bullet_radius*2)/sprite_get_height(sprite_index);
		
	bullet.bullet_seek_range = action_shoot_bullet_seek_range;
	bullet.bullet_seek_turn_rate = action_shoot_bullet_seek_turn_rate;
	bullet.bullet_lifespan = (action_shoot_bullet_range + random_mirror(action_shoot_range_chaos) )/ bullet.status_movespeed_base;
	bullet.bullet_collision_tile_action = "die";
		
	bullet.animation_sprite = action_shoot_bullet_type[1];
	
	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*action_shoot_damage[0], true, "main_attack"]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", status_flinch_total*action_shoot_flinch[0]]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", action_shoot_push[0], 0.75*SEC, "movement", ["multiply",1.5]]);
		
	bullet.bullet_death_spawn_trigger = action_shoot_flag_explode_trigger;
	bullet.collision_impact_health_max = action_shoot_bullet_collision_impact_health;
	bullet.collision_impact_health_current = action_shoot_bullet_collision_impact_health;
	
	if (action_shoot_bullet_tile_phase == true){
		bullet.collision_enabled_tiles = false
	}
	
	var round_radius = round(action_shoot_bullet_explosion);
	
	if (round_radius > 0){
		bullet.bullet_death_spawn[?"explosion_radius_max"] = round_radius;
		bullet.bullet_death_spawn[?"explosion_lifespan_base"] = round_radius/(420*PPS);
		bullet.bullet_death_spawn[?"explosion_lifespan_current"] = round_radius/(420*PPS);;
		bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = action_shoot_flair_color;
		bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
		bullet.bullet_death_spawn[?"status_immortal"] = true;
	
		bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
			["damage", "actor", status_damage_total*action_shoot_damage[1], true, "main_attack"],
			["flinch", "actor", status_flinch_total*action_shoot_flinch[1]],
			["push", "actor", action_shoot_push[1], 0.5*SEC, "center", ["multiply",1.5]],
		]
	} else {
		bullet.bullet_death_spawn[?"type"] = noone
	}
		
	
	
	if (action_shoot_bullet_particles[0] != undefined && action_shoot_bullet_particles[1] > 0){
		ds_list_add(
			bullet.draw_particle_list, 
			action_shoot_bullet_particles
		);
	}

	bullet_count --;
}	

entity_motion_push((action_shoot_recoil_range), (action_shoot_recoil_speed/(action_shoot_recoil_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");


