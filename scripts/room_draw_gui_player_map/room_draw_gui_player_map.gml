var me = id;

var screen_width = window_get_width();
var screen_height = window_get_height();

var room_max = max(room_width,room_height);
var room_min = min(room_width,room_height)
	
var minimap_size = 160;
var minimap_margin = 10
var minimap_sizemargin = minimap_size + minimap_margin;
	
var minimap_center_x = screen_width - minimap_sizemargin + minimap_size/2;
var minimap_center_y = screen_height - minimap_sizemargin + minimap_size/2;
	
draw_set_color(make_color_rgb(255,255,255))
draw_set_alpha(0.25);
draw_rectangle(screen_width - minimap_sizemargin, screen_height - minimap_sizemargin, screen_width - minimap_margin, screen_height - minimap_margin, false);
draw_set_alpha(0.65);
	
draw_set_color(make_color_rgb(0,255,255))
draw_circle(minimap_center_x, minimap_center_y, 2, false);
	
with(ACTOR){
	if (id != me.player_main_actor){
		var x_offset = ((x - me.player_main_actor.x)/room_max) * (minimap_size*1.2);
		var y_offset = ((y - me.player_main_actor.y)/room_max) * (minimap_size*1.2);
			
		var position_x = minimap_center_x + x_offset;
		var position_y = minimap_center_y + y_offset;
			
		if (
			(position_x > screen_width - minimap_sizemargin && position_x < screen_width - minimap_margin) &&
			(position_y > screen_height - minimap_sizemargin && position_y < screen_height - minimap_margin)
		){				
			draw_set_color(make_color_rgb(255, (me.player_faction != player_faction) ? 0 : 255, 0));
			with(me){draw_circle(position_x,position_y, 1.5, false)};
		}
	}
}