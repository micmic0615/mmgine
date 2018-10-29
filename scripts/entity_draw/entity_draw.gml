if (ACTIVE && ALIVE){
	draw_sprite_ext( sprite_index, image_index, x, y, image_xscale*animation_direction, image_yscale, animation_angle, c_white , 1 );
	entity_run_class_scripts("draw");
}