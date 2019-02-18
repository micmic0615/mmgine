screen_cover_alpha = 1.25;
screen_cover_color = c_white;
stage_spawn_immortal_duration = 1.5*SEC;

stage_spawn_cycle = 0;
global.draw_tips = !variable_global_exists("draw_tips") ? true : global.draw_tips;

ds_list_add(room_module_list, ["demo", [
	"step",
	"draw_gui",
]])