var action_map = argument[0];
var target_entity = action_map[?"target_entity"];

if (
	entity_enabled(target_entity) && 
	action_map[?"success"]
){
	entity_move_point([target_entity.x, target_entity.y]);
	entity_run_type_scripts("action_chase_channel_point", target_entity);
}