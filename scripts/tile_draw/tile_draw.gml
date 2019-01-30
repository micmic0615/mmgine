if (entity_enabled()){
	if (camera_inside_view){
		draw_self();
		tile_run_scripts("draw");
	}
}