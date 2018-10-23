var angle = radtodeg(arctan2((argument1 - y), (argument0 - x)));
var move_x = cos(degtorad(angle))*status_total_movespeed/status_total_movesnap;
var move_y = sin(degtorad(angle))*status_total_movespeed/status_total_movesnap;
entity_add_motion(move_x, move_y, status_total_movesnap);