var action_map = argument[0];
var target_entity = action_map[?"target_entity"];
action_map[?"success"] = false

entity_run_type_scripts("action_chase_cast_point", target_entity);