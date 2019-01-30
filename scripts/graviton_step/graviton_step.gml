var me = id
with(ENTITY){
	if (entity_enabled()){
		var entity_distance = distance_between(me.x, me.y, x, y);
		if (entity_distance <= me.my_radius_gravity_effect){
			var angle = angle_clean(radtodeg(arctan2(me.y - y, me.x - x)));
			physics_gravity_angle = angle
			
			if (entity_distance > me.my_radius_gravity_core){
				physics_gravity_force = GRAVITY_FORCE;
				physics_gravity_max = GRAVITY_MAX;
			} else {
				physics_gravity_force = GRAVITY_FORCE*4;
				physics_gravity_max = GRAVITY_MAX*4;
			
				//if (entity_class_lower == "actor"){
				//	actor_buff_apply("speed_bonus_raw", 0.5*SEC, [500*PPS], "graviton_sling")
				//}
			}
		
		
		}
	}
}

animation_angle += 180*PPS;