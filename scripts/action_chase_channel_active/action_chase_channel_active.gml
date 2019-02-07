var action_map = argument[0];
var target_entity = action_map[?"target_entity"];

if (entity_enabled(target_entity)){
	if (action_map[?"distance"] > 0){
		if (
			!target_entity.status_immortal && 
			distance_between(x,y,target_entity.x,target_entity.y) < action_map[?"distance"]
		){
			action_map[?"success"] = true;
			action_map[?"channel_timer"] = 0;
		} 
	}
	
	if (entity_room_age_modulo(0.1*SEC)){					
		entity_mirage_create(0.25*SEC, 0, 0, action_map[?"color"], 0.5);
	}
				
	actor_buff_apply("movespeed_set_raw", 1, [action_map[?"movespeed_set"]], "chase_movespeed");
	actor_buff_apply("movesnap_set_raw", 1, [action_map[?"movesnap_set"]], "chase_movesnap");
	entity_move_point([target_entity.x, target_entity.y]);
	
	entity_run_type_scripts("action_chase_channel_active", target_entity);
} else {
	action_map[?"channel_timer"] = 0;
}