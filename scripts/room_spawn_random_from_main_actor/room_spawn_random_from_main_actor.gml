var actor_type = argument0;
var spawned_actor = noone;
if (instance_exists(ROOM.player_main_actor)){
	var center = ROOM.player_main_actor;
	var random_distance = 600 + random(600);
	var random_angle = degtorad(random(360));
		
	var spawn_x = center.x + (cos(random_angle)*random_distance);
	var spawn_y = center.y + (sin(random_angle)*random_distance);
		
	spawned_actor = actor_spawn(spawn_x,spawn_y,actor_type);
	spawned_actor.ai_delay = 2*SEC;
}

return spawned_actor