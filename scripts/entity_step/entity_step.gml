physics_motion_x = 0;
physics_motion_y = 0;
for(var i = 0; i < ds_list_size(physics_motion_list);i++){
	var p = ds_list_find_index(physics_motion_list, i);
	
	var motion_x = p[0];
	var motion_y = p[1];
	var motion_lifespan = p[2];
	
	
	physics_motion_x += motion_x;
	physics_motion_y += motion_y;
	
	if (motion_lifespan < INFINITY){
		ds_list_replace(physics_motion_list, i, [
			motion_x,
			motion_y,
			motion_lifespan - 1
		])
	}
}

for(var i = 0; i < ds_list_size(physics_motion_list);i++){
	var p = ds_list_find_index(physics_motion_list, i);
	var motion_lifespan = p[2];
	
	if (motion_lifespan <= 0){
		ds_list_delete(physics_motion_list, i);
	}
}


x += physics_motion_x;
y += physics_motion_y;

entity_run_scripts("step");