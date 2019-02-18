var selected_slot = undefined;
var selected_skill = undefined;
var mc = player_main_actor;
if (mc.my_shoot_mod_select != undefined){		
	switch(mc.my_shoot_mod_select){
		case 0:
		case 1:
			selected_slot = "beatdown";
			break
				
		case 2:
		case 3:
		case 4:
		case 7:
		case 8:
		case 9:
			selected_slot = "aux";
			break
			
		case 5:
		case 6:
			selected_slot = "mod";
			break		
				
		case 10:
		case 11:
			selected_slot = "passive";
			break
	}
	with(mc){
		selected_skill = hero_skill_get_name(my_shoot_mod_cycle)
	}
	
}

return [selected_slot, selected_skill];