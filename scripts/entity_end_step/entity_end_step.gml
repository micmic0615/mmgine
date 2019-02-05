if (entity_enabled()){
	#region //CAMERA
		var camera_view_x = camera_get_view_x(view_camera[0]);
		var camera_view_y = camera_get_view_y(view_camera[0]);
		var camera_size_w = camera_get_view_width(view_camera[0]);
		var camera_size_h = camera_get_view_height(view_camera[0]);

		var camera_padding_x = sprite_width/2;
		var camera_padding_y = sprite_height/2; 
		
		var inside_x = (x > camera_view_x - camera_padding_x && x < camera_view_x + camera_size_w + camera_padding_x);
		var inside_y = (y > camera_view_y - camera_padding_y && y < camera_view_y + camera_size_h + camera_padding_y);

		camera_inside_view = (inside_x && inside_y) ? true : false;
	#endregion
	
	#region //SCRIPTS
		entity_run_class_scripts("step");
		if (collision_count[1] > 0){entity_run_class_scripts("collide_tile")}
		if ( ROOM.room_age_real % collision_modulo == collision_index){
			if (collision_count[0] > 0){entity_run_class_scripts("collide_entity")}
		}
	#endregion

	#region //ANIMATION
		if (ds_exists(draw_particle_list, ds_type_list)){
			for(var i = 0; i < ds_list_size(draw_particle_list);i++){
				var p = ds_list_find_value(draw_particle_list, i);
				part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p[2]),x+random_mirror(p[2]),y+random_mirror(p[2]),y+random_mirror(p[2]),ps_shape_ellipse,1);
				part_emitter_burst(global.particle_system,draw_particle_emitter,p[0],p[1]);
			}
		}
	
		var	animation_sprite_name = asset_get_index(animation_sprite + "_" + animation_name);
		sprite_index = (animation_sprite_name > 0) ? animation_sprite_name : asset_get_index(animation_sprite + "_idle");
	#endregion
	
	#region //TINT
		if (draw_blend_temporary_duration >= 0){
			draw_blend_temporary_duration--;
			switch(draw_blend_temporary_style){
				case "solid":
					image_blend = draw_blend_temporary_color;
					break;
					
				case "flicker":
					image_blend = (ROOM.room_age_real % 2 == 1) ? draw_blend_temporary_color : c_white;
					break;
			}
			
		} else {
			image_blend = c_white;
		}
	#endregion
		
	#region//HEALTH
		if (status_health_current <= 0){
			var me = id;
			if (entity_killer != noone && instance_exists(entity_killer)){
				with(entity_killer){entity_kill(me)}
			} else {
				entity_kill(me)
			}
			
		}
	#endregion
} else {
	#region //DEATH
		instance_destroy(id, false);	
	#endregion
}

