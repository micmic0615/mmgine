var target_x = argument0;
var target_y = argument1;

var origin_x = argument2;
var origin_y = argument3;

var angle = radtodeg(arctan2(target_y - origin_y, target_x - origin_x));
while(angle >= 360){angle -= 360}
while(angle < 0){angle += 360}

return angle;