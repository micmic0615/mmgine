var type = argument0;
var ds_item = undefined;
 
switch(type){
	case "map":
		ds_item = ds_map_create();
		break;
		
	case "grid":
		var grid_args = argument[1];
		ds_item = ds_grid_create(grid_args[0], grid_args[1]);
		break;
	
	case "list":
	default:
		ds_item = ds_list_create();
		break;
}

ds_list_add(ds_inventory, ds_item);
return ds_item;