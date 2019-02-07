var target = argument[0];
var did_barrage = action_generic_trigger(action_barrage, target);

if (did_barrage){
	if (action_barrage[?"sequence"] == 0){	
		entity_run_type_scripts("action_barrage_trigger", action_barrage);
		action_barrage[?"cast_timer"] = action_barrage[?"cast_value"];	
		action_barrage[?"sequence"] = 1;
		actor_actions_id = "barrage";
		
		if (is_array(target)){
			action_barrage[?"target_point"] = target;
		} else {
			action_generic_target_entity_to_point(action_barrage);
		}
		
		var target_point = action_barrage[?"target_point"];
		
		action_barrage[?"active_angle"] = angle_between(target_point[0], target_point[1], x,y);
	}
}

return did_barrage;