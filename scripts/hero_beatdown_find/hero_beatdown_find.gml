var beatdown_string = argument0;
var return_bool = false;
for(var i = 0; i < ds_list_size(my_beatdown_list);i++){
	var p = ds_list_find_value(my_beatdown_list, i);
	if (p == beatdown_string){return_bool = true}
}

return return_bool