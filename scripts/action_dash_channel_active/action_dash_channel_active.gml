var action_map = argument[0];
entity_run_type_scripts("action_dash_channel_active", action_map);

if (entity_room_age_modulo(0.04*SEC)){
	entity_mirage_create(0.3*SEC, 0, 0, action_map[?"color"], 0.35);
}