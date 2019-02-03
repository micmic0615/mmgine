var me = id;
var ai_chase_limit = argument0;
with(ACTOR){
	if (entity_enabled() && variable_instance_exists(id, "ai_type_id")){
		if (ai_type_id == me.ai_type_id && ai_target == me.ai_target && ai_target_attack_should_channel){
			ai_chase_limit--;				
		}
	}
}
	
ai_chase_limit--;
return (ai_chase_limit >= 0)