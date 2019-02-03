for(var i = 0; i < ds_list_size(my_infest_bug_list);i++){
	var p = ds_list_find_value(my_infest_bug_list, i);
	var bug = p[1];
	bug.bullet_lifespan = 1;
}