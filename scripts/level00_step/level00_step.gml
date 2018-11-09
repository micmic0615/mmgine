if (ds_exists(stage_actors_list, ds_type_list)){
	if (stage_phase_delay_timer <= 0){
		var script_run = asset_get_index(  "level00_phase" + string(stage_phase) );
		if (script_run > -1){script_execute(script_run)};
	} else {
		stage_phase_delay_timer -= TIMESPEED;
	}

	for(var i = 0; i < ds_list_size(stage_actors_list);i++){
		var p = ds_list_find_value(stage_actors_list, i);
		if (!instance_exists(p)){ds_list_delete(stage_actors_list, i); i--;}
	}

	if (screen_cover_alpha > 0){screen_cover_alpha -= 1*PPS*TIMESPEED}
}

