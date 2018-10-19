physics_motion_x = 0;
physics_motion_y = 0;

for(var i = 0; i < ds_list_size(physics_motion_list);i++){
	var p = ds_list_find_value(physics_motion_list, i);
	
	var motion_x = p[0];
	var motion_y = p[1];
	var motion_lifespan = p[2];
	var motion_decay = p[3];
	var motion_id = p[4];
	
	physics_motion_x += motion_x;
	physics_motion_y += motion_y;
	
	if (motion_lifespan < INFINITY){
		ds_list_replace(physics_motion_list, i, [
			motion_x,
			motion_y,
			motion_lifespan - 1,
			motion_decay,
			motion_id
		])
	}
}

for(var i = 0; i < ds_list_size(physics_motion_list);i++){
	var p = ds_list_find_value(physics_motion_list, i);
	var motion_lifespan = p[2];
	
	if (motion_lifespan <= 0){
		ds_list_delete(physics_motion_list, i);
	}
}

var movement_x = floor(physics_motion_x);
var movement_y = floor(physics_motion_y);

physics_motion_spill_x += (physics_motion_x - movement_x);
physics_motion_spill_y += (physics_motion_y - movement_y);

if (physics_motion_spill_x > 1){ physics_motion_spill_x -= 1; movement_x += 1; };
if (physics_motion_spill_y > 1){ physics_motion_spill_y -= 1; movement_y += 1; };

x += movement_x;
y += movement_y;

entity_run_scripts("step");