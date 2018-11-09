var actor_type = argument[0];

var base_distance =  argument_count >= 2 ? argument[1] : 600
var base_random =  argument_count >= 3 ? argument[2] : 600
var spawned_actor = noone;
if (instance_exists(ROOM.player_main_actor)){
	var center = ROOM.player_main_actor;
	var random_distance = base_distance + random(base_random);
	var random_angle = degtorad(random(360));
		
	var spawn_x = center.x + (cos(random_angle)*random_distance);
	var spawn_y = center.y + (sin(random_angle)*random_distance);
		
	spawned_actor = actor_spawn(spawn_x,spawn_y,actor_type);
	spawned_actor.ai_delay = 2*SEC;
}

return spawned_actor