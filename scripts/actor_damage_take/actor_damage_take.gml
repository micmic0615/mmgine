var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];

base_value = base_value - (base_value*(status_armor_health/100));

var adjusted_args = entity_run_type_scripts("damage_take", [base_source, base_value, base_lethal]);

var adjusted_source = is_array(adjusted_args) ? adjusted_args[0] : base_source;
var adjusted_value = is_array(adjusted_args) ? adjusted_args[1] : base_value;
var adjusted_lethal = is_array(adjusted_args) ? adjusted_args[2] : base_lethal;

if (ROOM.player_main_actor == id){
	if (actor_buff_find("flinched") == undefined && adjusted_source != id){
		room_timespeed_temp(0.05, 0.5*SEC, true)
	}
};

draw_blend_temporary_color = make_color_rgb(255,0,0);
draw_blend_temporary_duration = 0.5*SEC;
draw_blend_temporary_style = "flicker";


	
return [adjusted_source, adjusted_value, adjusted_lethal];