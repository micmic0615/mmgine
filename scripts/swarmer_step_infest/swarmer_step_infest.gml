var me = id;

for(var i = 0; i < ds_list_size(my_infest_bug_list);i++){
	var p = ds_list_find_value(my_infest_bug_list, i);
	var target = p[0];
	var bug = p[1];
	var bug_angle = p[2];
	var bug_distance = p[3];
	var bug_scale = p[4];
	var bug_duration = p[5];
	var rad_angle = degtorad(bug_angle);
	
	if (entity_enabled(bug) && entity_enabled(target)){
		
	
		if (bug_duration < my_infest_duration){
			ds_list_replace(my_infest_bug_list, i, [
				target,
				bug,
				bug_angle + my_infest_rotate_speed,
				bug_distance + my_infest_enlarge_speed,
				bug_scale + my_infest_scale_speed,
				bug_duration + TIMESPEED
			]);
			
			if (bug_duration > (my_infest_duration - 1*SEC)){
				ds_list_replace(
					bug.draw_particle_list, 
					1,
					[game_particle_setup_basic(my_infest_color_1, 1.5 + random(2), 0.5, 0.25*SEC), 6, my_infest_bullet_radius/2]
				);
				
				ds_list_replace(
					bug.draw_particle_list, 
					1,
					[game_particle_setup_basic(my_infest_color_3, 2 + random(2), 0.25, 0.15*SEC), 12, my_infest_bullet_radius]
				);
				
				if (entity_room_age_modulo(0.1*SEC)){					
					with(bug){
						entity_sfx_create_pulse(
							/*sprite*/ ExplosionBulletAlt_idle,
							/*duration*/ 0.35*SEC,
							/*blend*/ me.my_infest_color_3,
							/*style_data*/ [
								0,
								me.my_infest_bullet_radius/1.5,
								2
							]
						);
					}
				}
			} else {
				if (entity_room_age_modulo(0.15*SEC)){					
					with(bug){
						entity_sfx_create_pulse(
							/*sprite*/ ExplosionBulletAlt_idle,
							/*duration*/ 0.35*SEC,
							/*blend*/ me.my_infest_color_1,
							/*style_data*/ [
								0,
								me.my_infest_bullet_radius/2,
								2
							]
						);
					}
				}
			}
			
			if (bug_duration >= 1*SEC && bug.collision_enabled_bullets == false){
				bug.collision_enabled_bullets = true;
				bug.collision_enabled_actors = true;
				ROOM.entity_collisions_validate = true;
			};
			
			bug.x = target.x + (cos(rad_angle)*bug_distance);
			bug.y = target.y + (sin(rad_angle)*bug_distance);
			
			
		
			bug.image_xscale = bug_scale;
			bug.image_yscale = bug_scale;
		
			bug.animation_angle = point_direction(bug.x, bug.y, target.x, target.y)
		
		} else {
			
			bug.bullet_lifespan = 0.25*SEC;
			with(bug){
				entity_motion_push(bug_distance*2, bug.bullet_lifespan, angle_between(target.x,target.y, bug.x,bug.y));
			}
		
			ds_list_delete(my_infest_bug_list, i)
		}
	} else {
		if (entity_enabled(bug)){bug.bullet_lifespan = 1};
		ds_list_delete(my_infest_bug_list, i);
	}
};
	