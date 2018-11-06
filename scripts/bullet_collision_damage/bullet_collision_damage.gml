if (ACTIVE && ALIVE){
	var args = argument0;
	var me = id;
	
	var target_class = args[1];
	var value_damage = args[2];
	var value_lethal = args[3];

	if (instance_exists(bullet_origin)){
		for(var i = 0; i < ds_list_size(collision_entities);i++){
			var p = ds_list_find_value(collision_entities, i);
			if (p.entity_class_lower == target_class){
				with(bullet_origin){		
					entity_damage_deal([p, value_damage, value_lethal])
				}
			}
		}
	} else {
		for(var i = 0; i < ds_list_size(collision_entities);i++){
			var p = ds_list_find_value(collision_entities, i);
			if (p.entity_class_lower == target_class){
				entity_damage_deal([p, value_damage, value_lethal])
			}
		}
	}
}