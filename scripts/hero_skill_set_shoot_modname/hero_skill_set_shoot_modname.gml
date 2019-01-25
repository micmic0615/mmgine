var dir = argument0;
if (sign(dir) == 1){
	if (my_shoot_mod_cycle < 6){my_shoot_mod_cycle++} else {my_shoot_mod_cycle = 0}
} else if (sign(dir) == -1){
	if (my_shoot_mod_cycle > 0){my_shoot_mod_cycle--} else {my_shoot_mod_cycle = 6}
}
var mod_name = hero_skill_get_name(my_shoot_mod_cycle);
var mod_ban = "";
for(var i = 0; i < ds_list_size(my_shoot_mod_skip);i++){
	var p = ds_list_find_value(my_shoot_mod_skip, i);
	mod_ban += p + "-";
}

while(string_pos(mod_name, mod_ban) > 0){
	if (sign(dir) == 1){
		if (my_shoot_mod_cycle < 6){my_shoot_mod_cycle++} else {my_shoot_mod_cycle = 0}
	} else if (sign(dir) == -1){
		if (my_shoot_mod_cycle > 0){my_shoot_mod_cycle--} else {my_shoot_mod_cycle = 6}
	}
	
	mod_name = hero_skill_get_name(my_shoot_mod_cycle);
}

return mod_name;