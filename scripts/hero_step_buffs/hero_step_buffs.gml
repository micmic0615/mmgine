var has_ping = 0;
var has_autoshield = 0;
var has_grit_attacc = 0
var has_iframe = 0

var is_flinched = false;

for(var i = 0; i < ds_list_size(status_buff_list);i++){
	var p = ds_list_find_value(status_buff_list, i);
	var type = p[0];
	var buff_id = p[3];
	var duration = p[1];
	
	if (has_ping == 0 && buff_id == "ping_speed_burst"){
		has_ping = duration
	}
	
	if (has_grit_attacc == 0 && buff_id == "grit_attacc"){
		has_grit_attacc = duration;
	}
	
	if (has_autoshield == 0 && buff_id == "autoshield"){
		has_autoshield = duration;
	}
	
	if (type == "flinched"){
		is_flinched = true
	}
	
	if (buff_id == "dash_iframe"){
		has_iframe = duration
	}
}

var floor_age = floor(ROOM.room_age_game);
var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
		
if (has_ping > 0){	
	if (animation_name == "walk"){animation_name = "dash"};
	var duration_ratio = (has_ping/(3*SEC));
	
	if (floor_age % (0.1*SEC) == 0 && floor_age != next_floor_age){
		entity_mirage_create(0.2*SEC + (duration_ratio*0.3*SEC), 0, 0, make_color_rgb(255,0,255), 0.35)
	};
	
	draw_blend_temporary_style = "solid";
	draw_blend_temporary_duration = has_ping;
	var color_number = (230 * (1 - power(duration_ratio, 3))) + 25
	draw_blend_temporary_color = make_color_rgb(255, color_number, 255);
	
	//draw_blend_temporary_color = make_color_rgb(255, 255, 255);
}

if (has_autoshield > 0){
	actor_buff_remove("flinched");
	status_poise_current = status_poise_max;
}

if (has_grit_attacc > 0){
	draw_blend_temporary_style = "flicker";
	draw_blend_temporary_duration = has_grit_attacc;
	draw_blend_temporary_color = c_red;
	var p_model_1 = game_particle_setup_basic(c_red, (2 + random(3)), 0.5, 0.5*SEC, pt_shape_flare);
	hero_particles_create(100, p_model_1, 4);
}

if (is_flinched){
	my_rally_limit = status_health_current;
	my_charge_meter_1 = 0;
	my_charge_meter_2 = 0;
}

if (has_iframe){
	draw_blend_temporary_style = "solid";
	draw_blend_temporary_duration = has_iframe;
	var black_number = (125 * (1 - (has_iframe/my_dash_iframe))) + 25
	draw_blend_temporary_color = make_color_rgb(black_number, black_number, black_number);
}

