var duration = argument0;
var bullet_angle = argument1;
var mirage_color = argument2;
var spawn_x = argument3;
var spawn_y = argument4;

var rad_angle = degtorad(bullet_angle);
var mirage_flip = (bullet_angle <= 90 && bullet_angle >= 0) || (bullet_angle <= 360 && bullet_angle >= 270)
var mirage_angle = mirage_flip ? point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) : point_direction(x,y,x+(cos(rad_angle)*10),y+(sin(rad_angle)*10)) - 180;
var mirage_direction = mirage_flip ? 1 : -1;

entity_mirage_create(duration, spawn_x, spawn_y, mirage_color, 0.5, mirage_angle, mirage_direction, Hero_attack, 0);