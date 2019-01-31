var check_x = argument0;
var check_y = argument1;

var camera_view_x = camera_get_view_x(view_camera[0]);
var camera_view_y = camera_get_view_y(view_camera[0]);
var camera_size_w = camera_get_view_width(view_camera[0]);
var camera_size_h = camera_get_view_height(view_camera[0]);

var camera_padding_x = sprite_width/2;
var camera_padding_y = sprite_height/2; 
		
var inside_x = (check_x > camera_view_x - camera_padding_x && check_x < camera_view_x + camera_size_w + camera_padding_x);
var inside_y = (check_y > camera_view_y - camera_padding_y && check_y < camera_view_y + camera_size_h + camera_padding_y);

return (inside_x && inside_y) ? true : false;