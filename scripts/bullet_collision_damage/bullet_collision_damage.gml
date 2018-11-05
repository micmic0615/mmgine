if (ACTIVE && ALIVE){
	var p = argument0;
	var me = id;

	var value_damage = p[1];
	var value_lethal = p[2];

	if (instance_exists(bullet_origin)){
		for(var i = 0; i < ds_list_size(collision_entities);i++){
			var p = ds_list_find_value(collision_entities, i);
			with(bullet_origin){		
				entity_damage_deal([p, value_damage, value_lethal])
			}
		}
	} else {
		for(var i = 0; i < ds_list_size(collision_entities);i++){
			var p = ds_list_find_value(collision_entities, i);
			entity_damage_deal([p, value_damage, value_lethal])
		}
	}
}