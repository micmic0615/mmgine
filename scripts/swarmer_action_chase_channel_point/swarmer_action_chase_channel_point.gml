for(var i = 0; i < ds_list_size(action_clone_family);i++){
	var p = ds_list_find_value(action_clone_family, i);
	p.action_chase[?"channel_timer"]  = 0;
	p.action_chase[?"success"]  = true;
};

var infester = action_clone_original == true ? id : action_clone_parent;

with(infester){			
	var target_angle = radtodeg(random(360))
	var target_point = [
		x + (cos(target_angle)*999),
		y + (sin(target_angle)*999),
	];
			
	for(var i = 0; i < ds_list_size(action_clone_family);i++){
		var p = ds_list_find_value(action_clone_family, i);
		p.action_chase[?"success"] = false;
		with(p){
			action_dash_cooldown_reset();
			action_dash_trigger(target_point);
		};
	};
			
	swarmer_action_infest(action_chase[?"target_entity"]);
}

