var argument_array = argument0;

var new_blend = true;
for(var i = 0; i < ds_list_size(draw_blend_temporary_list);i++){
	var p = ds_list_find_value(draw_blend_temporary_list, i);
	var duration = p[2];
	var blend_id = p[3];
	if(argument_array[3] == blend_id){
		ds_list_replace(draw_blend_temporary_list, i, argument_array);
		new_blend = false;
	}
}

if (new_blend){
	ds_list_add(draw_blend_temporary_list, argument_array)
}