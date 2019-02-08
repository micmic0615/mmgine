var action_map = argument[0];
action_generic_target_entity_to_point(action_map);
action_barrage_animation_face(action_map);
entity_run_type_scripts("action_barrage_channel_active", action_map);

if (entity_room_age_modulo(action_map[?"interval"])){	
	action_generic_fire_bullet_trigger(action_map, action_map[?"active_angle"])
}