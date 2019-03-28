var actor_x = argument[0];
var actor_y = argument[1];
var actor_type = argument[2];

var spawn_id = "null";
if (global.replay_mode == "record"){
	spawn_id = global.actor_id_sequence;
	global.actor_id_sequence++;
} else if (global.replay_mode == "play") {
	spawn_id = argument_count >= 4 ? argument[3] : "null";
}

var spawned_actor = instance_create_depth(actor_x, actor_y, depth, actor_type);

with(spawned_actor){
	ROOM = instance_find(ROOM_OBJECT, 0);
	ACTIVE = true;
	actor_id = spawn_id;
	//actor_record_replay_data("spawn_actor", [actor_type]);
}	

return spawned_actor;