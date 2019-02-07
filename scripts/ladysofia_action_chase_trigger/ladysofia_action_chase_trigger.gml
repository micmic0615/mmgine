if (entity_enabled(action_chase[?"target_entity"])){
	var target = action_chase[?"target_entity"]
	var distance = distance_between(x,y,target.x,target.y);
	if (distance < 540){
		//entity_motion_push(1200, 1*SEC, angle_between(x,y,target.x,target.y), ["multiply", 1.1])
	}
}