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
		if (ds_exists(draw_blend_temporary_list, ds_type_list)){
			var blend_size = ds_list_size(draw_blend_temporary_list);
			var blend_array = [draw_blend_permanent_color];
			if (blend_size == 1){
				
				var p = ds_list_find_value(draw_blend_temporary_list, 0);
				var color = p[0];
				var style = p[1];
				if (style == "solid"){
					blend_array[0] = color
				} else {
					blend_array[1] = color
				}
			} else {
				for(var i = 0; i < blend_size;i++){
					var p = ds_list_find_value(draw_blend_temporary_list, i);
					var color = p[0];
					blend_array[i] = color;	
				}
			}
			
			for(var i = 0; i < ds_list_size(draw_blend_temporary_list);i++){
				var p = ds_list_find_value(draw_blend_temporary_list, i);
				ds_list_replace(draw_blend_temporary_list, i, [
					p[0],
					p[1],
					(p[2] - TIMESPEED),
					p[3],
				]);
			}
			
			for(var i = 0; i < ds_list_size(draw_blend_temporary_list);i++){
				var p = ds_list_find_value(draw_blend_temporary_list, i);
				if (p[2] <= 0){
					ds_list_delete(draw_blend_temporary_list, i);
				}
			}
		
			var blend_array_length = array_length_1d(blend_array);
			for(var i = 0; i < blend_array_length;i++){
				if (floor(ROOM.room_age_real / (0.05*SEC)) % blend_array_length == i){
					image_blend = blend_array[i];
				}
			}
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

