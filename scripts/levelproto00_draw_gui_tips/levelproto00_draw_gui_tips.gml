var start_height = argument0;
var mc = player_main_actor;

if (mc != noone && instance_exists(mc) && mc.active && mc.alive){
	var current_skill = levelproto00_get_hero_skill();
	
	var active_slot = current_skill[0];
	var active_skill = current_skill[1];
	
	if (active_slot != undefined && active_skill != undefined){
		var active_slot_string =  string_upper(active_slot);
		if (active_slot == "aux"){active_slot_string = "ATTACK MODIFIER"}
		if (active_slot == "mod"){active_slot_string = "ATTACK CORE"}
		
		if (active_skill != "none"){
			draw_text_color(10,start_height, "SKILL: " + string_upper(active_skill) + "()", c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_color(10,start_height, "NO SKILL EQUIPPED", c_white, c_white, c_white, c_white, 1);
		}
		
		draw_text_color(10,start_height + 20, "SLOT: " + active_slot_string, c_white, c_white, c_white, c_white, 1);
		
		switch(active_slot){
			case "beatdown": levelproto00_draw_gui_skills_beatdown(start_height + 50, active_skill); break
			case "aux": levelproto00_draw_gui_skills_aux(start_height + 50, active_skill); break
			case "mod": levelproto00_draw_gui_skills_mod(start_height + 50, active_skill); break
			case "passive": levelproto00_draw_gui_skills_passive(start_height + 50, active_skill); break
		}
	}
}