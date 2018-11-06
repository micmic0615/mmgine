var args = argument0;
var adjusted_args = entity_run_type_scripts("damage_take", args);
if (ROOM.player_main_actor == id){room_timespeed_temp(0.05, 0.5*SEC, true)};

draw_blend_temporary_color = make_color_rgb(255,0,0);
draw_blend_temporary_duration = 0.5*SEC;
draw_blend_temporary_style = "flicker";
return adjusted_args;