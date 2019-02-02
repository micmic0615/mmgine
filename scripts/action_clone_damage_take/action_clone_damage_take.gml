var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];
var me = id;

if (actor_clone_original == true){
	for(var i = 0; i < ds_list_size(actor_clone_children);i++){
		var p = ds_list_find_value(actor_clone_children, i);
		entity_damage_deal([p, base_value, false, "clone_spread"]);
	};
} else {
	if (entity_enabled(base_source)){		
		if (damage_id != "clone_spread"){
			with(base_source){
				entity_damage_deal([me.actor_clone_parent, base_value, base_lethal, damage_id])
			}
			
			base_value = -1;
			base_lethal = false;
		}	
	} else {
		base_value = -1;
		base_lethal = false;
	}
}

for(var i = 0; i < ds_list_size(actor_clone_family);i++){
	var p = ds_list_find_value(actor_clone_family, i);
	p.actor_clone_draw_timer = 0.5*SEC;
};

return [base_source, base_value, base_lethal];
