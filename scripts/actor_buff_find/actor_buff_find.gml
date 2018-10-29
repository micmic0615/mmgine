//var type = argument[0];
//var duration = argument[1];
//var arguments = argument[2];
//var buff_id = (argument_count >= 4) ? argument[3] : ("random_buff_id_" + string(random(INFINITY)) + "_" + string(random(INFINITY)) + "_" + string(random(INFINITY)));

//var buff_id_unique = true
//var buff_list_length = ds_list_size(status_buff_list);
//for(var i = 0; i < buff_list_length;i++){
//	var p = ds_list_find_value(status_buff_list, i);
//	var list_buff_id = p[3];
	
//	if (list_buff_id == buff_id){
//		buff_id_unique = false;
//		ds_list_replace(status_buff_list, i, [
//			type,
//			duration,
//			arguments,
//			buff_id
//		])
//	}
//}

//if (buff_id_unique == true){
//	ds_list_add(status_buff_list, [type, duration, arguments, buff_id])
//}