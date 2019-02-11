var me = id;

var screen_width = window_get_width();
var screen_height = window_get_height();

var room_max = max(room_width,room_height);
var room_min = min(room_width,room_height)
	
var minimap_size = 160;
var minimap_margin = 10
var minimap_sizemargin = minimap_size + minimap_margin;
	
var minimap_center_x = minimap_size/2;
var minimap_center_y = minimap_size/2;


if (!variable_instance_exists(id, "draw_minimap_surface") || !surface_exists(draw_minimap_surface)){
	draw_minimap_surface = surface_create(minimap_size, minimap_size);
}



surface_set_target(draw_minimap_surface);
draw_clear_alpha(c_black, 1);

	
draw_set_color(make_color_rgb(255,255,255))
draw_set_alpha(0.25);
draw_rectangle(0, 0, minimap_size, minimap_size, false);
draw_set_alpha(0.75);
draw_set_color(make_color_rgb(0,255,255))
draw_circle(minimap_center_x, minimap_center_y, 2, false);
	
with(ACTOR){
	if (id != me.player_main_actor){
		var x_offset = ((x - me.player_main_actor.x)/room_max) * (minimap_size*1.2);
		var y_offset = ((y - me.player_main_actor.y)/room_max) * (minimap_size*1.2);
			
		var position_x = minimap_center_x + x_offset;
		var position_y = minimap_center_y + y_offset;
					
		draw_set_color(make_color_rgb(255, (me.player_faction != player_faction) ? 0 : 255, 0));
		with(me){draw_circle(position_x,position_y, 1.5, false)};
	}
}



with(TILE){
	var x_offset = ((x - me.player_main_actor.x)/room_max) * (minimap_size*1.2);
	var y_offset = ((y - me.player_main_actor.y)/room_max) * (minimap_size*1.2);
	
	var position_x = minimap_center_x + x_offset;
	var position_y = minimap_center_y + y_offset;
	
	var tile_width = sprite_width * ((minimap_size*1.2)/room_max) * 0.5;
	var tile_height = sprite_height * ((minimap_size*1.2)/room_max) * 0.5;
				
		draw_set_color(make_color_rgb(20,20,20));
		with(me){
			draw_rectangle(
				position_x - tile_width,
				position_y - tile_height,
				position_x + tile_width,
				position_y + tile_height,
				false
			)
		};
}

surface_reset_target();
draw_surface(draw_minimap_surface, screen_width - minimap_size - minimap_margin, screen_height - minimap_size - minimap_margin);