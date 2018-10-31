var target_x = argument0;
var target_y = argument1;
var spawn_x = argument2;
var spawn_y = argument3;
var spawn_type = argument4;

var angle = angle_between(target_x, target_y, spawn_x, spawn_y);
var bullet = instance_create_depth(spawn_x, spawn_y, depth, spawn_type);

bullet.player_faction = player_faction;
bullet.bullet_action_move_angle = angle;
bullet.bullet_origin = id;

return bullet;