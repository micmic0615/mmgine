var action_map = argument[0];
action_generic_target_entity_to_point(action_map);
entity_face_point(action_map[?"target_point"]);

var execution_time_total = action_map[?"cast_value"] + action_map[?"channel_value"] + action_map[?"backswing_value"] + action_map[?"cooldown_value"]
action_map[?"combo_timer"] = execution_time_total*1.5;

if (action_map[?"combo_count"] < action_map[?"combo_max"]){
	action_map[?"combo_count"]++
} else {
	action_map[?"combo_count"] = 0;
}

entity_run_type_scripts("action_shoot_cast_point", action_map);

var target_point = action_map[?"target_point"];
var target_angle = angle_between(target_point[0], target_point[1], x,y);
action_generic_fire_bullet_trigger(action_map, target_angle)

