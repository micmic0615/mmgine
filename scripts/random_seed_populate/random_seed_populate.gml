if (ds_list_size(global.random_seed) - global.random_index < 10){
	var seed_insert = 0;
	while(seed_insert < 100){
		ds_list_add(global.random_seed, random(1));
		seed_insert++;
	}
}