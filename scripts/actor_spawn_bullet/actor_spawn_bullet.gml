var spawn_x = argument0;
var spawn_y = argument1;
var spawn_type = argument2;

var angle = angle_between(actor_action_point_x, actor_action_point_y, spawn_x, spawn_y);
var bullet = instance_create_depth(spawn_x, spawn_y, layer, spawn_type);

bullet.player_faction = player_faction;
bullet.bullet_action_move_angle = angle;
bullet.bullet_origin = id;

return bullet;