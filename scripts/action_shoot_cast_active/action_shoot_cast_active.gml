var action_map = argument[0];
action_generic_target_entity_to_point(action_map);
entity_face_point(action_map[?"target_point"]);
entity_run_type_scripts("action_shoot_cast_active", action_map);

