if (ACTIVE && ALIVE ){
	if (camera_inside_view){
		draw_sprite_ext( sprite_index, image_index, x, y, image_xscale*animation_direction, image_yscale, animation_angle, image_blend , image_alpha );
	}
	
	



	entity_run_class_scripts("draw");
}

