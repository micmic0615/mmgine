if (my_dodge_active){
	var me = id;
	if (my_dodge_timer <= 0){
		with(BULLET){
			if (entity_enabled() && ds_list_find_index(collision_entities_valid, me) > -1){
				var bullet_distance = distance_between(x,y,me.x,me.y);
				if (bullet_distance < 220 && bullet_distance > 120){
					var bullet = id;
					var ran_dir = random(2);
					var dodge_dir = (ran_dir > 1 ? 60 : -60) + random_mirror(30);
				
					var did_dodge = false;
					with(me){					
						var rad_angle = degtorad(bullet.bullet_action_move_angle + dodge_dir);
						var angle_x = x + (cos(rad_angle)*10);
						var angle_y = y + (sin(rad_angle)*10);
					
						did_dodge = action_dash_trigger([angle_x, angle_y]);
					}
					
					if (did_dodge){
						me.my_dodge_timer = me.my_dodge_value;
					}
				}
			}
		}
	}
}

if(actor_buff_find("flinched") != undefined){
	my_dodge_timer = 0;
}


if (my_dodge_timer > 0){
	my_dodge_timer -= TIMESPEED
}