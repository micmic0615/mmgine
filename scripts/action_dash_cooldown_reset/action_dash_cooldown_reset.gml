ds_list_clear(action_dash[?"cooldown_multi_timer"]);
var combo_max = action_dash[?"combo_max"];

while(combo_max > 0){
	ds_list_add(action_dash[?"cooldown_multi_timer"], 0);
	combo_max--;
}