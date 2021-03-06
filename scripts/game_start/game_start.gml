if (room_get_name(room) == "RM0_GAME"){
	room_speed = 60;

	#macro ACTIVE active
	#macro ALIVE alive
	#macro ROOM room_object

	#macro INFINITY 9999999
	#macro TIMESPEED (global.time_speed*physics_time_local)
	//#macro PPS (1/(room_speed/TIMESPEED))
	#macro PPS (1/(room_speed))
	#macro SEC (room_speed) div 1

	#macro GRAVITY_ANGLE global.gravity_angle
	#macro GRAVITY_FORCE global.gravity_force
	#macro GRAVITY_MAX global.gravity_max
	global.time_speed = 1;
	global.time_base = 1;
	global.time_change_value = 1;
	global.time_change_duration = 0;
	global.time_change_gradient = false;

	global.mouse_1 = mb_left;
	global.mouse_2 = mb_right;
	global.mouse_3 = mb_middle;

	global.key_up = ord("W");
	global.key_down = ord("S");
	global.key_left = ord("A");
	global.key_right = ord("D");
	global.key_heal = ord("R");

	global.key_tab = vk_tab;
	global.key_shift = vk_shift;
	global.key_num_1 = ord("1");
	global.key_num_2 = ord("2");
	global.key_num_3 = ord("3");
	global.key_num_4 = ord("4");
	global.key_num_5 = ord("5");
	global.key_num_6 = ord("6");
	global.key_num_7 = ord("7");
	global.key_num_8 = ord("8");
	global.key_num_9 = ord("9");
	global.key_num_0 = ord("0");

	global.key_select_right = vk_right;
	global.key_select_left = vk_left;
	global.key_select_up = vk_up;
	global.key_select_down = vk_down;

	global.key_action_1 = vk_space;

	global.key_pause = vk_enter;
	global.key_replay_load = vk_escape;
	global.key_backspace = vk_backspace;

	global.room_class = undefined;
	global.room_type = undefined;
	global.room_current = RM2_VersusOne;

	global.random_seed = ds_list_create();

	global.replay_data = ds_map_create();
	global.replay_mode = "record";
	global.replay_duration = 0;
	global.actor_id_sequence = 0;

	global.particle_system = part_system_create();

	global.hero_mod_1 = "do";
	global.hero_mod_2 = "crash";

	global.hero_aux_1 = ds_list_create();
	global.hero_aux_2 = ds_list_create();

	global.hero_beatdown_list = ds_list_create();
	global.hero_passive_list = ds_list_create();

	ds_list_add(global.hero_aux_1, "none");
	ds_list_add(global.hero_aux_1, "none");
	ds_list_add(global.hero_aux_1, "none");

	ds_list_add(global.hero_aux_2, "none");
	ds_list_add(global.hero_aux_2, "none");
	ds_list_add(global.hero_aux_2, "none");

	ds_list_add(global.hero_beatdown_list, "do");
	ds_list_add(global.hero_beatdown_list, "none");

	ds_list_add(global.hero_passive_list, "none");
	ds_list_add(global.hero_passive_list, "none");
	
	var current_room = room;
	
	global.room_heirarchy = ds_map_create();
	var parent_one = "";
	var parent_two = "";
	
	while(room_exists(current_room)){
		var room_string = room_get_name(current_room);
		var room_level = string_char_at(room_string, 3);
		
		switch(room_level){
			case "1": 
				ds_map_add(global.room_heirarchy, room_string, ds_map_create()); 
				parent_one = room_string;
				break
				
			case "2":
				var parent_one_map = ds_map_find_value(global.room_heirarchy, parent_one);
				ds_map_add(parent_one_map, room_string, ds_list_create());
				parent_two = room_string;
				break
			
			case "3":
				var parent_one_map = ds_map_find_value(global.room_heirarchy, parent_one);
				var parent_two_map = ds_map_find_value(parent_one_map, parent_two);
				ds_list_add(parent_two_map, room_string);
				break
		}
		
		current_room++;
	}
} 

room_init();