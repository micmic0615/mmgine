var action_map = argument[0];
action_generic_target_entity_to_point(action_map);
action_barrage_animation_face(action_map);
entity_run_type_scripts("action_barrage_cast_active", action_map[?"target_point"]);