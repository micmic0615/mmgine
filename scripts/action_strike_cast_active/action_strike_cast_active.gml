var action_map = argument[0];
action_generic_target_entity_to_point(action_map);
	
if (action_map[?"cast_timer"] > action_map[?"cast_aim_limit"]){
	action_map[?"strike_point"] = action_map[?"target_point"]
}

entity_face_point(action_map[?"strike_point"]);

entity_run_type_scripts("action_strike_cast_active", action_map);
