for(var i = 0; i < ds_list_size(ds_inventory);i++){
	var p = ds_list_find_value(ds_inventory, i);
	var item = p[0];
	var type = p[1];
	
	switch(type){
		case "map":
			ds_map_destroy(item);
			break;
		
		case "grid":
			ds_grid_destroy(item);
			break;
	
		case "list":
		default:
			ds_list_destroy(item);
			break;
	}
}

ds_list_destroy(ds_inventory);