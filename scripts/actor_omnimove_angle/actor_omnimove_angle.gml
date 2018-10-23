var angle = degtorad(argument0);
var move_x = cos(angle)*status_total_movespeed/status_total_movesnap;
var move_y = sin(angle)*status_total_movespeed/status_total_movesnap;
entity_add_motion(move_x, move_y, status_total_movesnap);