if (entity_enabled()){
	var args = argument0;
	var me = id;
	
	var target_class = args[1];
	var value_damage = args[2];
	var value_lethal = args[3];
	var damage_id = undefined;
	if (array_length_1d(args) >= 5){damage_id = args[4]};

	if (entity_enabled(bullet_origin)){
		for(var i = 0; i < ds_list_size(collision_entities_connect);i++){
			var p = ds_list_find_value(collision_entities_connect, i);
			if (entity_enabled(p) && p.entity_class_lower == target_class){
				with(bullet_origin){		
					entity_damage_deal([p, value_damage, value_lethal, damage_id])
				}
			}
		}
	} else {
		for(var i = 0; i < ds_list_size(collision_entities_connect);i++){
			var p = ds_list_find_value(collision_entities_connect, i);
			if (entity_enabled(p) && p.entity_class_lower == target_class){
				entity_damage_deal([p, value_damage, value_lethal, damage_id])
			}
		}
	}
}