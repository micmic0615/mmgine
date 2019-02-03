if (!my_chase_success_validation){
	var activate = true;

	for(var i = 0; i < ds_list_size(action_clone_family);i++){
		var p = ds_list_find_value(action_clone_family, i);
		if (p.action_chase_success != true){
			p.action_chase_active_timer = 0;
			p.action_chase_success = true;
			activate = false;
		}
	};

	if (activate){
		for(var i = 0; i < ds_list_size(action_clone_family);i++){
			var p = ds_list_find_value(action_clone_family, i);
			p.my_chase_success_validation = true
			p.my_chase_delay_timer = p.my_chase_delay_value;
			ds_list_clear(p.physics_motion_list)
		};
	}
} else {
	my_chase_delay_timer -= TIMESPEED;
	if (my_chase_delay_timer <= 0){
		if (action_clone_original == true){
			var me = id;
			with(action_chase_target){
				entity_sfx_create_pulse(
					/*sprite*/ ExplosionBulletAlt_idle,
					/*duration*/ 0.5*SEC,
					/*blend*/ me.my_infest_color_1,
					/*style_data*/ [
						0,
						150,
						1.5
					]
				);
				
				entity_sfx_create_pulse(
					/*sprite*/ ExplosionBulletAlt_idle,
					/*duration*/ 0.75*SEC,
					/*blend*/ me.my_infest_color_2,
					/*style_data*/ [
						0,
						160,
						1.5
					]
				);
				
				entity_sfx_create_pulse(
					/*sprite*/ ExplosionBulletAlt_idle,
					/*duration*/ 1*SEC,
					/*blend*/ me.my_infest_color_1,
					/*style_data*/ [
						0,
						170,
						1.5
					]
				);
			}
			
			var target_angle = radtodeg(random(360))
			var target_point = [
				x + (cos(target_angle)*999),
				y + (sin(target_angle)*999),
			];
			
			for(var i = 0; i < ds_list_size(action_clone_family);i++){
				var p = ds_list_find_value(action_clone_family, i);
				p.action_chase_success = false;
				p.my_chase_success_validation = false;
				p.action_dash_cooldown_timer = 0;
				with(p){action_dash_trigger(target_point)};
			};
			
			swarmer_action_infest(action_chase_target);
		}
	}
}
