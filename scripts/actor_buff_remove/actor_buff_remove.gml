var buff_filter = argument0;
var buff_found = undefined;

if (ACTIVE && ALIVE){
	var buff_list_length = ds_list_size(status_buff_list);
	for(var i = 0; i < buff_list_length;i++){
		var p = ds_list_find_value(status_buff_list, i);
		var type = p[0];
		var buff_id = p[3];
	
		if (buff_filter == type || buff_filter == buff_id){
			buff_found = p;
			
			ds_list_replace(status_buff_list, i, [
				p[0],
				1,
				p[2],
				p[3]
			])
		}
	}
}

return buff_found