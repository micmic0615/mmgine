if (entity_enabled()){
	var args = argument0;
	
	var target_class = "actor";
	var value_poise_damage = args[2];
	
	if (instance_exists(bullet_origin)){
		for(var i = 0; i < ds_list_size(collision_entities_connect);i++){
			var p = ds_list_find_value(collision_entities_connect, i);
			if (entity_enabled(p) && p.entity_class_lower == target_class){
				with(bullet_origin){		
					actor_flinch_deal([p, value_poise_damage])
				}
			}
		}
	} else {
		for(var i = 0; i < ds_list_size(collision_entities_connect);i++){
			var p = ds_list_find_value(collision_entities_connect, i);
			if (entity_enabled(p) && p.entity_class_lower == target_class){
				actor_flinch_deal([p, value_poise_damage])
			}
		}
	}
}