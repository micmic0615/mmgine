var dir = argument0;
var max_size = ds_list_size(my_skill_list) - 1;
if (sign(dir) == 1){
	if (my_shoot_mod_cycle < max_size){my_shoot_mod_cycle++} else {my_shoot_mod_cycle = 0}
} else if (sign(dir) == -1){
	if (my_shoot_mod_cycle > 0){my_shoot_mod_cycle--} else {my_shoot_mod_cycle = max_size}
}

var mod_name = hero_skill_get_name(my_shoot_mod_cycle);
var mod_ban = (my_shoot_mod_select == 5 || my_shoot_mod_select == 6) ? "none" : "";
for(var i = 0; i < ds_list_size(my_shoot_mod_skip);i++){
	var p = ds_list_find_value(my_shoot_mod_skip, i);
	if (p != "none"){mod_ban += p + "-"};
}

while(string_pos(mod_name, mod_ban) > 0){
	if (sign(dir) == 1){
		if (my_shoot_mod_cycle < max_size){my_shoot_mod_cycle++} else {my_shoot_mod_cycle = 0}
	} else if (sign(dir) == -1){
		if (my_shoot_mod_cycle > 0){my_shoot_mod_cycle--} else {my_shoot_mod_cycle = max_size}
	}
	
	mod_name = hero_skill_get_name(my_shoot_mod_cycle);
}

return mod_name;