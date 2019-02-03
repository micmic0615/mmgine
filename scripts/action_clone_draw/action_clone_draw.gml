var is_flinched = false;
if (actor_buff_find("flinched") != undefined){is_flinched = true}

if (action_clone_draw_timer > 0 || is_flinched){
	action_clone_draw_timer -= TIMESPEED;
	
	var family_length = ds_list_size(action_clone_family);
	var sibling = noone;
	for(var i = 0; i < family_length;i++){
		var p = ds_list_find_value(action_clone_family, i);
		if (p == id){
			if (i+1 < family_length){
				sibling = ds_list_find_value(action_clone_family, i+1);
			} else {
				sibling = ds_list_find_value(action_clone_family, 0);
			}
		}
	};

	if (sibling != noone){
		var draw_time =  is_flinched ? 2 : (action_clone_draw_timer/(0.5*SEC))
		var draw_color = is_flinched ? make_color_rgb(255,255,0) : c_red;
		draw_set_alpha(random(1.5)*draw_time)
		var angle = degtorad(angle_between(sibling.x,sibling.y, x,y));
		var limit = 45 + random_mirror(20);
		var distance = distance_between(sibling.x,sibling.y, x,y) - limit;
		
		var angle_x = cos(angle);
		var angle_y = sin(angle);
		
		draw_line_width_color(x + (angle_x*limit),y + (angle_y*limit),x + (angle_x*distance), y + (angle_y*distance), random(2), draw_color, draw_color);
		draw_set_alpha(1);
	}
}
